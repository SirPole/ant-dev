FROM node:8-alpine

MAINTAINER Martin Brychta <martin@brychta.name>

ENV npm_cache_dir=/tmp

WORKDIR /app

RUN apk add --no-cache \
        git \
        python \
        tar \
    && npm i -g --unsafe-perm\
        concurrently \
        del-cli \
        node-sass \
        npm@latest \
        npm-check-updates \
        sass-lint \
        tldr
