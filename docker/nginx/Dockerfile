FROM nginx:alpine

MAINTAINER Martin Brychta <martin@brychta.name>

COPY etc/nginx.conf /etc/nginx/nginx.conf

RUN apk add --no-cache \
        openssl \
        curl \
    && mkdir -p /etc/nginx/.ssl \
    && openssl req -subj '/CN=localhost' -x509 -newkey rsa:4096 -nodes -keyout /etc/nginx/.ssl/key.pem -out /etc/nginx/.ssl/cert.pem -days 3650 \
    && chmod 0400 /etc/nginx/.ssl/key.pem /etc/nginx/.ssl/cert.pem \
    && curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/options-ssl-nginx.conf > /etc/nginx/.ssl/options-ssl-nginx.conf \
    && curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot/ssl-dhparams.pem > /etc/nginx/.ssl/ssl-dhparams.pem

WORKDIR /var/www/html
