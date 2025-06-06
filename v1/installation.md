> [!NOTE]  
> Work in progress

# Installation Guide

## Docker Installation

<details>
<summary>Install Docker on Ubuntu</summary>

::: tip
```bash
sudo apt update -y && \
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
sudo apt update -y && \
sudo apt install -y docker-ce
```
:::

</details>

## Application Setup

### 1. Clone the Repository
```bash
git clone https://github.com/your-repo/your-project.git
cd your-project
```

### 2. Start the Application
```bash
docker-compose up -d
```

::: warning
Make sure ports 3001 and 8000 are available on your system.
:::


## Manual Installation

If you prefer not to use Docker, follow these steps:

### 1. Prerequisites
- Node.js (v20 or higher)
- npm (v6 or higher)

### 2. Install and Run
```bash
cd cookiecms && \
npm install && \
npm run init && \
npm run start
```

::: info
The application will be available at http://localhost:3001 and the API at http://localhost:8000
:::


## Reverse Proxy Setup

### Configure Nginx as a reverse proxy

Create a new Nginx config file:

```bash
sudo nano /etc/nginx/sites-available/your-project
```

Add the following configuration:

```nginx
server {
    listen 80;
    server_name domain.com;

    location / {
        proxy_pass http://127.0.0.1:3001;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

    location /api {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

Enable the site and restart Nginx:

```bash
sudo ln -s /etc/nginx/sites-available/your-project /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

::: tip
To enable HTTPS, uncomment the SSL sections and use Certbot to obtain certificates:
```bash
sudo apt install certbot python3-certbot-nginx
sudo certbot
```
:::
