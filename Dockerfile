FROM php:7.1.11-apache-jessie

MAINTAINER Martin Brychta <martin@brychta.name>

# Install dependencies
RUN apt-get update && apt-get install -yqq \
		git \
		tar \
		g++ \
		bzip2 \
		zlib1g-dev \
		libmcrypt-dev \
		libxml2-dev \
		libpng12-dev \
		libfontconfig \
		libicu-dev

# Enable required php extensions
RUN docker-php-ext-install -j$(nproc) mbstring \
    	&& docker-php-ext-install -j$(nproc) zip \
    	&& docker-php-ext-install -j$(nproc) mcrypt \
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
RUN npm i -g phantomjs-prebuilt eslint babel-cli depcheck webpack-bundle-analyzer tldr ncu babel-eslint casperjs node-sass

# Apache virtual host configuration
COPY etc/apacheVirtualHost.conf /etc/apache2/sites-available/000-default.conf

# Extra php settings
COPY etc/phpExtra.ini /usr/local/etc/php/conf.d/extra.ini

# Startup script
COPY etc/startup /usr/local/startup

WORKDIR /var/www

CMD ["startup"]
