FROM php:7.1.11-apache-jessie

MAINTAINER Martin Brychta <martin@brychta.name>

# Apache virtual host configuration
ARG VHOST="  \
<VirtualHost *:80> \
    ServerName localhost \
    ServerAlias ant.loc \
    ServerAdmin martin@brychta.name \
    DocumentRoot /var/www \
    <Directory /var/www> \
        Options Indexes FollowSymLinks MultiViews \
        AllowOverride All \
        Require all granted \
    </Directory> \
</VirtualHost> \
"

# Extra php settings
ARG PHP_INI=" \
file_uploads = On \
memory_limit = 512M \
upload_max_filesize = 2048M \
post_max_size = 2048M \
max_execution_time = 600 \
"

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
    	&& docker-php-ext-install -j$(nproc) intl

# Install Composer
RUN curl -sL https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs

# Virtual host configuration
RUN echo ${VHOST} > /etc/apache2/sites-available/000-default.conf

# Extra php settings
RUN echo ${PHP_INI} > /usr/local/etc/php/conf.d/extra.ini

# Enable mod_rewrite
RUN a2enmod rewrite

WORKDIR /var/www
