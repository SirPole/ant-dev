FROM docker:stable

MAINTAINER Martin Brychta <martin@brychta.name>

RUN apk add --no-cache \
        bash \
        ca-certificates \
        curl \
        git \
        openssh-client \
        py-pip \
    && pip install docker-compose \
    && git clone https://github.com/SirPole/ant-dev.git
    && cd ant-dev
    && git checkout next

ENV PATH="/ant-dev/interpreters/unix:${PATH}"
