FROM httpd:alpine

MAINTAINER Martin Brychta <martin@brychta.name>

# Include apache virtual hosts, modules and startup script
COPY etc/httpd-extra.conf /usr/local/apache2/conf/extra/
COPY etc/startup /usr/local/bin/

# Enable apache mods, ssl host and startup script
RUN apk add --no-cache \
        openssl \
    && openssl req -subj '/CN=localhost' -x509 -newkey rsa:4096 -nodes -keyout /usr/local/apache2/conf/key.pem -out /usr/local/apache2/conf/cert.pem -days 3650 \
    && chmod 0400 /usr/local/apache2/conf/key.pem /usr/local/apache2/conf/cert.pem \
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

WORKDIR /var/www/html
ENTRYPOINT ["/usr/local/bin/startup"]
CMD [""]
