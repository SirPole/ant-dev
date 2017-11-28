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
ARG VHOST="\
<VirtualHost *:80>\n\
	ServerName localhost\n\
	ServerAlias ant.loc\n\
	ServerAdmin martin@brychta.name\n\
	DocumentRoot /var/www\n\
	<Directory /var/www>\n\
		Options Indexes FollowSymLinks MultiViews\n\
		AllowOverride All\n\
		Require all granted\n\
	</Directory>\n\
</VirtualHost>\n"

# Extra php settings
ARG PHP_INI="\
file_uploads = On\n\
memory_limit = 512M\n\
upload_max_filesize = 2048M\n\
post_max_size = 2048M\n\
max_execution_time = 600\n"

# Virtual host configuration
RUN echo "${VHOST}" > /etc/apache2/sites-available/000-default.conf

# Extra php settings
RUN echo "${PHP_INI}" > /usr/local/etc/php/conf.d/extra.ini

WORKDIR /var/www
