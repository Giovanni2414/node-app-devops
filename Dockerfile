FROM node:16-alpine

LABEL "Script author"="Giovanni"
LABEL "Project description"="Node app"

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . .

CMD ["npm","run","start"]

