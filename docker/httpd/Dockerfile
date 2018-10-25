FROM httpd:alpine

MAINTAINER Martin Brychta <martin@brychta.name>

# Include apache virtual hosts, modules, startup script and stunnel
COPY etc/httpd-extra.conf /usr/local/apache2/conf/extra/
COPY etc/startup /usr/local/bin/
COPY etc/stunnel.conf /etc/stunnel/

# Enable apache mods, ssl host and startup script
RUN apk upgrade --update \
    && apk add --no-cache openssl \
    && openssl genrsa -des3 -passout pass:x -out /etc/ssl/certs/key.pem 2048 \
    && cp /etc/ssl/certs/key.pem /etc/ssl/certs/key.pem.orig \
    && openssl rsa -passin pass:x -in /etc/ssl/certs/key.pem.orig -out /etc/ssl/certs/key.pem \
    && openssl req -new -key /etc/ssl/certs/key.pem -out /etc/ssl/certs/cert.csr -subj "/C=CZ/ST=CZ/L=Pilsen/O=ANT studio s.r.o./OU=Development/CN=antstudio.cz" \
    && openssl x509 -req -days 3650 -in /etc/ssl/certs/cert.csr -signkey /etc/ssl/certs/key.pem -out /etc/ssl/certs/cert.pem \
    && chmod +x /usr/local/bin/startup \
    && echo "Include conf/extra/httpd-extra.conf" >> /usr/local/apache2/conf/httpd.conf

WORKDIR /usr/local/apache2/htdocs
ENTRYPOINT ["/usr/local/bin/startup"]
CMD [""]
