FROM node:7.7.2-alpine

WORKDIR /usr/app

RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /usr/local/bin/cc-test-reporter
RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > "$/usr/local/bin/cc-test-reporter"
RUN chmod +x "/usr/local/bin/cc-test-reporter"

RUN apk update && apk add postgresql
COPY package.json .
RUN npm install --quiet

COPY . .
