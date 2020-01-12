FROM node:10-buster-slim

MAINTAINER Martin Brychta <martin@brychta.name>

ENV npm_cache_dir=/tmp
ENV DOCKER_ENV=1

WORKDIR /app

RUN apt-get update -qq && apt-get install -yqq --no-install-recommends \
        fonts-liberation \
        gconf-service \
        git \
        libappindicator1 \
        libasound2 \
        libatk1.0-0 \
        libcairo2 \
        libcups2 \
        libdbus-1-3 \
        libgconf-2-4 \
        libgdk-pixbuf2.0-0 \
        libgtk-3-0 \
        libnspr4 \
        libnss3 \
        libpango-1.0-0 \
        libpangocairo-1.0-0 \
        libx11-6 \
        libx11-xcb1 \
        libxcb1 \
        libxcomposite1 \
        libxcursor1 \
        libxdamage1 \
        libxext6 \
        libxfixes3 \
        libxi6 \
        libxrandr2 \
        libxrender1 \
        libxss1 \
        libxtst6 \
        python \
        tar \
        wget \
        xdg-utils \
    && rm -rf /var/lib/apt/lists/* \
    && npm i -g --unsafe-perm \
        concurrently \
        del-cli \
        npm@latest \
        npm-check-updates \
        sass-lint
