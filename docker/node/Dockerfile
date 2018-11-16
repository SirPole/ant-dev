FROM node:8-alpine

MAINTAINER Martin Brychta <martin@brychta.name>

ENV npm_cache_dir=/tmp

WORKDIR /app

RUN npm i -g \
    concurrently \
    del-cli \
    npm@latest \
    npm-check-updates \
    sass-lint \
    tldr
