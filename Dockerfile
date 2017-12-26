FROM php:apache-stretch

MAINTAINER Martin Brychta <martin@brychta.name>

# Install dependencies
RUN apt-get update && apt-get install -yqq \
    git \
    tar \
    g++ \
    bzip2 \
    gnupg \
    zlib1g-dev \
    libxml2-dev \
    libpng-dev \
    libfontconfig \
    libicu-dev

# Enable required php extensions
RUN docker-php-ext-install -j$(nproc) mbstring \
    && docker-php-ext-install -j$(nproc) zip \
    && docker-php-ext-install -j$(nproc) soap \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-install -j$(nproc) pdo \
    && docker-php-ext-install -j$(nproc) pdo_mysql

# Install Composer
RUN curl -sL https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs

# Enable mod_rewrite
RUN a2enmod rewrite headers

# Install global npm packages
RUN npm config set user 0 \
    && npm config set unsafe-perm true \
    && npm i -g \
        phantomjs-prebuilt \
        webpack-bundle-analyzer \
        tldr npm-check-updates \
        node-sass \
        sass-lint \
        concurrently \
        del-cli

# Apache virtual host configuration
COPY etc/apacheVirtualHost.conf /etc/apache2/sites-available/000-default.conf

# Extra php settings
COPY etc/phpExtra.ini /usr/local/etc/php/conf.d/extra.ini

# Startup script
COPY etc/startup /usr/local/bin/
RUN chmod +x /usr/local/bin/startup

WORKDIR /var/www

ENTRYPOINT ["/usr/local/bin/startup"]
CMD [""]
