# syntax=docker/dockerfile:1

FROM node:lts-alpine

USER node
RUN mkdir -p /home/node/app/node_modules
WORKDIR /home/node/app
COPY . .
RUN <<'SHELL'
    chmod 755 public
    npm install --save=false
    npx webpack
SHELL

CMD npm start
