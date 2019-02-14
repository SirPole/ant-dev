FROM nginx:alpine

MAINTAINER Martin Brychta <martin@brychta.name>

COPY etc/nginx.conf /etc/nginx/nginx.conf

RUN apk add --no-cache \
        openssl \
    && openssl req -subj '/CN=localhost' -x509 -newkey rsa:4096 -nodes -keyout /etc/nginx/key.pem -out /etc/nginx/cert.pem -days 3650

WORKDIR /var/www/html
