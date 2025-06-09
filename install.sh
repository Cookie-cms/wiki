#!/bin/bash

set -e

# === Настройки ===
FRONT_REPO="https://github.com/Cookie-cms/frontend.git"
BACK_REPO="https://github.com/Cookie-cms/cookiecms-js.git"
# Корневой каталог для установки
INSTALL_DIR="/opt/cookiecms"
FRONT_DIR="$INSTALL_DIR/frontend"
BACK_DIR="$INSTALL_DIR/backend"
BRANCH="main"
POSTGRES_CONTAINER_NAME="cookiecms-db"
POSTGRES_PORT=5432

# Создаем нужные директории
echo "🔧 Создание каталогов установки в $INSTALL_DIR..."
sudo mkdir -p "$INSTALL_DIR"
sudo chown "$USER":"$USER" "$INSTALL_DIR"
rm -rf "$FRONT_DIR" "$BACK_DIR"

# === Проверка Docker и docker-compose ===
echo "🔍 Проверка наличия Docker и Compose..."

if ! command -v docker &>/dev/null; then
  echo "❌ Docker не установлен. Установи его и повтори."
  exit 1
fi

if docker compose version &>/dev/null; then
  COMPOSE_CMD="docker compose"
elif command -v docker-compose &>/dev/null; then
  COMPOSE_CMD="docker-compose"
else
  echo "❌ Ни 'docker compose', ни 'docker-compose' не найдены."
  exit 1
fi

# === Запуск PostgreSQL ===
echo "[0/9] 🐘 Запуск PostgreSQL через Docker..."
$COMPOSE_CMD up -d db

# === Ожидание готовности БД ===
echo "⏳ Ожидание запуска PostgreSQL..."
for i in {1..20}; do
  if docker exec "$POSTGRES_CONTAINER_NAME" pg_isready -U cookiecms &>/dev/null; then
    echo "✅ PostgreSQL готов!"
    break
  fi
  echo "⏱️ Ожидание..."
  sleep 2
done

# === Клонирование репозиториев в /opt/cookiecms/ ===
echo "[1/9] 🔽 Клонирование репозиториев..."

git clone --depth 1 --branch "$BRANCH" "$FRONT_REPO" "$FRONT_DIR"
git clone --depth 1 --branch "$BRANCH" "$BACK_REPO" "$BACK_DIR"

# === Установка зависимостей ===
echo "[2/9] 📦 Установка зависимостей для frontend..."
cd "$FRONT_DIR"
npm ci

echo "[3/9] 📦 Установка зависимостей для backend..."
cd "$BACK_DIR"
npm ci

# === Генерация .env в backend ===
echo "[4/9] ⚙️ Создание .env..."
if [ ! -f ".env" ]; then
  if [ -f ".env.example" ]; then
    cp .env.example .env
    echo "✅ .env создан из .env.example"
  else
    echo "❌ .env.example не найден"
    exit 1
  fi
fi

sed -i "s/^SECURE_CODE=.*/SECURE_CODE=$(openssl rand -hex 16)/" .env
sed -i "s/^SERVICE_API_TOKEN=.*/SERVICE_API_TOKEN=$(openssl rand -hex 32)/" .env
sed -i "s/^ENV=.*/ENV=production/" .env
sed -i "s/^DB_HOST=.*/DB_HOST=localhost/" .env
sed -i "s/^DB_PORT=.*/DB_PORT=${POSTGRES_PORT}/" .env

# === Сборка фронтенда ===
echo "[5/9] 🛠️ Сборка frontend..."
cd "$FRONT_DIR"
npm run build

# === Запуск frontend через PM2 ===
echo "[6/9] 🚀 Запуск frontend через PM2..."
cd "$FRONT_DIR"
# Если PM2 не установлен, установим его
if ! command -v pm2 &>/dev/null; then
  echo "PM2 не найден, устанавливаем PM2 глобально..."
  npm install -g pm2
fi
pm2 start npm --name cookiecms-frontend -- run start
pm2 save

# === Миграции в backend ===
echo "[7/9] 🧱 Выполнение миграций..."
cd "$BACK_DIR"
knex migrate:latest --knexfile knexfile.js

# === Запуск backend через PM2 ===
echo "[8/9] 🚀 Запуск backend через PM2..."
cd "$BACK_DIR"
pm2 start npm --name cookiecms-backend -- run start
pm2 save

# Рекомендуем настроить автозапуск PM2 (требуются root-права)
echo "Настройка автозапуска PM2:"
sudo pm2 startup systemd -u $USER --hp $HOME

echo "[9/9] 🎉 Установка и запуск CookieCMS завершены!"