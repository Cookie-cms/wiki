FROM node:20-alpine

# Install git (required for VitePress)
RUN apk add --no-cache git

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .


CMD ["npm", "run", "server"]