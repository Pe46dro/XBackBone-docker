FROM webdevops/php-nginx:alpine-php7
MAINTAINER Pietro Marangon <pietro@marangon.me>

ARG XBACKBONE_VERSION=2.5.3
ENV URL=http:\/\/127.0.0.1

ADD ./nginx.conf /opt/docker/etc/nginx/vhost.common.d/1-xbackbone.conf
ADD ./configure.sh /opt/docker/provision/entrypoint.d/30-app.sh

USER application

RUN wget "https://github.com/SergiX44/XBackBone/releases/download/${XBACKBONE_VERSION}/release-v${XBACKBONE_VERSION}.zip" -O /app/master.zip; \
        cd /app; \
        unzip master.zip; \
        rm master.zip; \
        mv config.example.php config.php

VOLUME [ "/app/storage", "/app/resources/database", "/app/logs"]

#Fix #3
USER root
