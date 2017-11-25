FROM php:7.1.11-apache-jessie

MAINTAINER Martin Brychta <martin@brychta.name>

# Install dependencies
RUN apt-get update && apt-get install -yqq \
		git \
		tar \
		bzip2 \
		zlib1g-dev \
		libmcrypt-dev \
		libxml2-dev \
		libpng12-dev \
		libfontconfig

# Enable required php extensions
RUN docker-php-ext-install -j$(nproc) mbstring \
    	&& docker-php-ext-install -j$(nproc) zip \
    	&& docker-php-ext-install -j$(nproc) mcrypt \
    	&& docker-php-ext-install -j$(nproc) soap \
    	&& docker-php-ext-install -j$(nproc) gd

# Virtual host configuration
COPY vhost /etc/apache2/sites-available/000-default.conf

# Enable mod_rewrite
RUN a2enmod rewrite

# Install Composer
RUN curl -sL https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
	&& apt-get install -y nodejs

# Install global npm packages
RUN npm i -g gulp-cli bower yarn

WORKDIR /var/www
