FROM alpine:3.9 AS builder

ENV NGINX_VERSION 1.17.0

RUN apk add --no-cache \
        autoconf \
        automake \
        cmake \
        curl \
        gcc \
        git \
        g++ \
        libc-dev \
        libtool \
        linux-headers \
        make \
        pcre-dev \
        zlib-dev \
    && mkdir -p /usr/src \
    && cd /usr/src \
    && git clone --recursive https://github.com/eustas/ngx_brotli.git \
    && curl -fSL https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz -o nginx.tar.gz \
    && tar -zxC . -f nginx.tar.gz \
    && cd nginx-${NGINX_VERSION} \
    && ./configure \
        --with-compat \
        --add-dynamic-module=/usr/src/ngx_brotli \
    && make modules

FROM nginx:1.17.0-alpine

MAINTAINER Martin Brychta <martin@brychta.name>

ENV HOST dev.loc

COPY --from=builder /usr/src/nginx-${NGINX_VERSION}/objs/ngx_http_brotli_filter_module.so /etc/nginx/modules
COPY --from=builder /usr/src/nginx-${NGINX_VERSION}/objs/ngx_http_brotli_static_module.so /etc/nginx/modules

RUN apk add --no-cache \
        openssl \
        curl \
    && mkdir -p /etc/nginx/ssl \
    && openssl req -subj "/CN=${HOST}" -x509 -newkey rsa:4096 -nodes -keyout /etc/nginx/ssl/${HOST}.key -out /etc/nginx/ssl/${HOST}.crt -days 3650 \
    && openssl dhparam -dsaparam -out /etc/nginx/dhparam.pem 2048 \
    && chmod 400 /etc/nginx/ssl/${HOST}.key /etc/nginx/ssl/${HOST}.crt \
    && chmod 644 /etc/nginx/modules/*

WORKDIR /var/www/html

COPY etc/nginx.conf /etc/nginx/nginx.conf
