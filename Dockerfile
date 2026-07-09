FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm insall 
COPY . . 

RUN npm run build

EXPOSE 3000
CMD ["node", "dist/main"]