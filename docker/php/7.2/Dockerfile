FROM php:7.2-fpm-alpine

MAINTAINER Martin Brychta <martin@brychta.name>

# Extra php settings
COPY etc/phpExtra.ini /usr/local/etc/php/conf.d/extra.ini

RUN apk add --no-cache \
        freetype-dev \
        icu-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        libxml2-dev \
        libzip-dev \
    && apk add gnu-libiconv --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
    && curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/4.2.0.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mkdir -p /usr/src/php/ext \
    && mv phpredis-4.2.0 /usr/src/php/ext/redis \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-install -j$(nproc) \
        gd \
        intl \
        mysqli \
        opcache \
        pdo_mysql \
        redis \
        soap \
        zip \
    && sed -i \
        -e 's/^\(;\|\)\(pm.max_children =\).*/\2 128/' \
        -e 's/^\(;\|\)\(pm.start_servers =\).*/\2 16/' \
        -e 's/^\(;\|\)\(pm.min_spare_servers =\).*/\2 8/' \
        -e 's/^\(;\|\)\(pm.max_spare_servers =\).*/\2 16/' \
        -e 's/^\(;\|\)\(pm.max_requests =\).*/\2 1000/' \
        /usr/local/etc/php-fpm.d/www.conf

ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php
