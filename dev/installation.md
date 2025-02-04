> [!NOTE]  
> Work in progress

# installation
## Installation via docker

```bash
sudo apt update -y && \
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
sudo apt update -y && \
sudo apt install -y docker-ce
```

```bash
git clone ....
```

```bash
cd ... && \
docker-compose up -d
```

## Installation via script

```bash
# 
```

```bash
cd cookiecms && \
npm install && \
npm run init
npm run start
```

```bash