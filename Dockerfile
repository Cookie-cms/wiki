FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run docs:build

EXPOSE 3000

CMD ["npm", "run", "server"]