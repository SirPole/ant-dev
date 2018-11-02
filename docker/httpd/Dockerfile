FROM httpd:2.4.35-alpine

MAINTAINER Martin Brychta <martin@brychta.name>

# Include apache virtual hosts, modules, startup script and stunnel
COPY etc/httpd-extra.conf /usr/local/apache2/conf/extra/
COPY etc/startup /usr/local/bin/
COPY etc/stunnel.conf /etc/stunnel/

# Enable apache mods, ssl host and startup script
RUN sed -i -e 's/v[[:digit:]]\.[[:digit:]]/edge/g' /etc/apk/repositories \
    && apk upgrade --update --available \
    && apk add --no-cache \
        openssl \
        stunnel \
    && openssl genrsa -des3 -out server.key -passout pass:pass 2048 \
    && openssl rsa -in server.key -out server.key.insecure -passin pass:pass \
    && mv server.key server.key.secure \
    && mv server.key.insecure server.key \
    && openssl req -new -key server.key -out server.csr -subj "/C=CZ/ST=CZ/L=Pilsen/O=ANT studio s.r.o./OU=Development/CN=antstudio.cz" \
    && openssl x509 -req -days 3650 -in server.csr -signkey server.key -out server.crt \
    && cp server.crt /usr/local/apache2/conf \
    && cp server.key /usr/local/apache2/conf \
    && chmod +x /usr/local/bin/startup \
    && sed -i \
        -e 's/^#\(LoadModule .*mod_actions.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_deflate.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_expires.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_proxy.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_proxy_fcgi.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_proxy_http.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_rewrite.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
        -e 's/^#\(Include .*httpd-ssl.conf\)/\1/' \
        /usr/local/apache2/conf/httpd.conf \
    && echo "Include conf/extra/httpd-extra.conf" >> /usr/local/apache2/conf/httpd.conf

WORKDIR /usr/local/apache2/htdocs
ENTRYPOINT ["/usr/local/bin/startup"]
CMD [""]
