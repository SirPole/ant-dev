FROM php:5.6-apache-jessie

MAINTAINER Martin Brychta <martin@brychta.name>

# Set environment variables
ENV COMPOSER_HOME /.ant/composer
ENV npm_config_cache /.ant/npm
ENV TERM xterm-256color

# Install dependencies
RUN apt-get update \
    && apt-get install -yqq build-essential bzip2 ca-certificates fonts-liberation g++ gcc gconf-service gettext git gnupg libappindicator1 libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libfreetype6-dev libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libicu-dev libjpeg-dev libmcrypt-dev libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libpng-dev libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxml2-dev libxrandr2 libxrender1 libxss1 libxtst6 lsb-release make ssl-cert stunnel tar unzip vim wget xdg-utils zlib1g-dev zsh

# Install Oh My ZSH
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN cp -r /root/.oh-my-zsh /etc/skel
COPY etc/.zshrc /etc/skel
COPY etc/.zshrc /root

# Apache virtual host configuration
COPY etc/apacheVirtualHost.conf /etc/apache2/sites-available/000-default.conf
COPY etc/apacheVirtualHostSSL.conf /etc/apache2/sites-available/default-ssl.conf

# Enable apache mods and ssl host
RUN a2enmod deflate expires headers proxy proxy_http rewrite ssl \
    && a2ensite default-ssl

# Extra php settings
COPY etc/phpExtra.ini /usr/local/etc/php/conf.d/extra.ini

# Configure stunnel
COPY etc/stunnel.conf /etc/stunnel/
RUN sed -s "s/ENABLED=0/ENABLED=1/" /etc/default/stunnel4 > /etc/default/stunnel4

# Startup script
COPY etc/startup /usr/local/bin/
RUN chmod +x /usr/local/bin/startup

# Enable required php extensions
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd intl mbstring mcrypt mysql pdo pdo_mysql soap zip

# Install Composer
RUN curl -sL https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs

# Install global npm packages
RUN npm config set user 0 \
    && npm config set unsafe-perm true \
    && npm i -g concurrently del-cli npm@latest npm-check-updates puppeteer tldr

WORKDIR /var/www

ENTRYPOINT ["/usr/local/bin/startup"]
CMD [""]
