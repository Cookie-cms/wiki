## deprecated its not need to use this anymore
## Linux/macOS

### 1. **Получение Personal Access Token (PAT)**

1. Перейдите на [GitHub](https://github.com/) и войдите в аккаунт.
2. Перейдите в **Settings** → **Developer settings** → **Personal access tokens classic**.
3. Нажмите **Generate new token**, выберите разрешения (например, `repo` и `read:packages`).
4. Сохраните токен.

### 2. **Настройка npm для использования PAT**

1. В вашем проекте или глобально создайте/откройте файл `.npmrc`.
2. Добавьте строку для аутентификации с токеном:

   ```ini
   //npm.pkg.github.com/:_authToken=<your-token>
   ```

### 3. **Указание GitHub Registry для npm**

Чтобы использовать GitHub для пакетов, добавьте в `.npmrc`:

```ini
@my-org:registry=https://npm.pkg.github.com
```

### 4. **Установка пакетов с GitHub**

Используйте `npm install` для установки пакетов:

```bash
npm install @my-org/my-package
```

### 5. **Глобальная аутентификация**

Для глобальной аутентификации:

```bash
npm login --scope=@my-org --registry=https://npm.pkg.github.com
```

## Windows

Для Windows процесс будет аналогичным, с некоторыми отличиями в использовании команд и расположении файлов:

### 1. **Получение Personal Access Token (PAT)**

1. Перейдите на [GitHub](https://github.com/) и войдите в свой аккаунт.
2. Перейдите в **Settings** → **Developer settings** → **Personal access tokens classic**.
3. Нажмите **Generate new token**, выберите разрешения (например, `repo` и `read:packages`).
4. Сохраните токен.

### 2. **Настройка npm для использования PAT**

1. Откройте **Проводник Windows** и перейдите в домашнюю папку (обычно `C:\Users\<ваше-имя>`).
2. Создайте или откройте файл `.npmrc`:
   - Если хотите настроить для всего пользователя, откройте глобальный `.npmrc` в `C:\Users\<ваше-имя>\.npmrc`.
   - Для настройки только для проекта создайте файл `.npmrc` в корне вашего проекта.

3. Добавьте строку для аутентификации с вашим токеном:

   ```ini
   //npm.pkg.github.com/:_authToken=<your-token>
   ```

### 3. **Указание GitHub Registry для npm**

Чтобы указать GitHub как источник пакетов, добавьте в файл `.npmrc`:

```ini
@my-org:registry=https://npm.pkg.github.com
```

### 4. **Установка пакетов с GitHub**

Теперь вы можете использовать команду для установки пакетов с GitHub:

```bash
npm install @my-org/my-package
```

### 5. **Глобальная аутентификация**

Для глобальной аутентификации на Windows откройте командную строку или PowerShell и выполните:

```bash
npm login --scope=@my-org --registry=https://npm.pkg.github.com
```

Когда вас попросят ввести данные, используйте свой GitHub **username** и **Personal Access Token** как пароль.

