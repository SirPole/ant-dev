FROM node:10-alpine

MAINTAINER Martin Brychta <martin@brychta.name>

ENV npm_cache_dir=/tmp
ENV DOCKER_ENV=1

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
