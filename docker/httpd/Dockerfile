FROM httpd:alpine

MAINTAINER Martin Brychta <martin@brychta.name>

COPY etc/httpd-extra.conf /usr/local/apache2/conf/extra/

RUN sed -i \
        -e 's/^#\(LoadModule .*mod_actions.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_deflate.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_expires.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_proxy.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_proxy_fcgi.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_proxy_http.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_rewrite.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
        /usr/local/apache2/conf/httpd.conf \
    && echo "Include conf/extra/httpd-extra.conf" >> /usr/local/apache2/conf/httpd.conf \
    && mkdir -p /crt /var/www/html/log \
    && wget -O /crt/dhparam.pem https://ca.brychta.name/dhparam \
    && wget -O /crt/dev.loc.key https://ca.brychta.name/key \
    && wget -O /crt/dev.loc.crt https://ca.brychta.name/crt \
    && wget -O /crt/ca.pem https://ca.brychta.name
