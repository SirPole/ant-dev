FROM php:5.6-fpm-alpine

MAINTAINER Martin Brychta <martin@brychta.name>

# Extra php settings
COPY etc/phpExtra.ini /usr/local/etc/php-fpm.d/extra.ini

RUN apk upgrade --update --no-cache \
    && apk add --no-cache \
    freetype-dev \
    icu-dev \
    libjpeg-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libxml2-dev \
    libzip-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-install -j$(nproc) \
    gd \
    intl \
    mcrypt \
    mysql \
    mysqli \
    pdo_mysql \
    soap \
    zip
