FROM debian:stretch-slim

MAINTAINER Martin Brychta <martin@brychta.name>

EXPOSE 9222

COPY etc/startup.sh /usr/local/bin

RUN apt-get update && apt-get install --no-install-recommends -y \
        ca-certificates \
        gnupg2 \
        wget \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
    && apt-get update && apt-get --no-install-recommends -y install \
        google-chrome-stable \
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x /usr/local/bin/startup.sh

ENTRYPOINT ["/bin/sh", "/usr/local/bin/startup.sh"]
