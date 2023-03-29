FROM node:16-alpine

LABEL "Script author"="Giovanni"
LABEL "Project description"="Node app"

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /node-app-devops

COPY ./ ./node-app-devops

RUN npm install

CMD ["npm","run","start"]

#RUN cd /tmp/node-app && npm install && npm build && mkdir /node-app
#COPY /tmp/node-app/build/* /node-app/


