FROM node:13.13.0-alpine
WORKDIR /app
COPY ./src/package.json /app
RUN npm install
COPY ./src /app
CMD node index.js
