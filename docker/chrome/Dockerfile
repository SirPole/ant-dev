FROM alpine

MAINTAINER Martin Brychta <martin@brychta.name>

EXPOSE 9222

COPY etc/startup.sh /usr/local/bin

RUN sed -i -e 's/v[[:digit:]]\.[[:digit:]]/edge/g' /etc/apk/repositories \
    && apk upgrade --update --available \
    && apk add --no-cache \
        chromium \
        nss \
    && chmod +x /usr/local/bin/startup.sh

ENTRYPOINT ["/bin/sh", "/usr/local/bin/startup.sh"]
