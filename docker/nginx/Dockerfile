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

COPY --from=builder /usr/src/nginx-${NGINX_VERSION}/objs/ngx_http_brotli_filter_module.so /etc/nginx/modules
COPY --from=builder /usr/src/nginx-${NGINX_VERSION}/objs/ngx_http_brotli_static_module.so /etc/nginx/modules

RUN mkdir -p /crt \
    && wget -O /crt/dev.loc.key https://ca.brychta.name/key \
    && wget -O /crt/dev.loc.crt https://ca.brychta.name/fullchain \
    && wget -O /crt/ca.pem https://ca.brychta.name

WORKDIR /app

COPY etc/nginx.conf /etc/nginx/nginx.conf
