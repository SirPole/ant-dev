FROM php:7.1-fpm-alpine

MAINTAINER Martin Brychta <martin@brychta.name>

# Extra php settings
COPY etc/phpExtra.ini /usr/local/etc/php/conf.d/extra.ini

RUN apk add --no-cache \
        freetype-dev \
        icu-dev \
        libjpeg-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libxml2-dev \
        libzip-dev \
    && apk add gnu-libiconv --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-install -j$(nproc) \
        gd \
        intl \
        mcrypt \
        mysqli \
        pdo_mysql \
        soap \
        zip \
    && pecl install -o -f redis \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis \
    && sed -i \
        -e 's/^\(;\|\)\(pm.max_children =\).*/\2 128/' \
        -e 's/^\(;\|\)\(pm.start_servers =\).*/\2 16/' \
        -e 's/^\(;\|\)\(pm.min_spare_servers =\).*/\2 8/' \
        -e 's/^\(;\|\)\(pm.max_spare_servers =\).*/\2 16/' \
        -e 's/^\(;\|\)\(pm.max_requests =\).*/\2 1000/' \
        /usr/local/etc/php-fpm.d/www.conf

ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php
