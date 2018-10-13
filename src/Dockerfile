FROM webdevops/php-nginx:alpine-php7
MAINTAINER Pietro Marangon <pietro@marangon.me>

ENV URL=http:\/\/127.0.0.1
ENV GENERATE_RELEASE=FALSE

ADD src/nginx.conf /opt/docker/etc/nginx/vhost.common.d/1-xbackbone.conf
ADD src/configure.sh /opt/docker/provision/entrypoint.d/30-app.sh

RUN apk add --update nodejs npm; \
	chmod 644 /opt/docker/provision/entrypoint.d/30-app.sh; \
	npm install -g grunt-cli

USER application

RUN git clone "https://github.com/SergiX44/XBackBone.git" /app/; \
	cd /app; \
	npm install; \
	grunt; \
	composer install --no-dev; \
	mv config.example.php config.php

VOLUME [ "/app/storage", "/app/resources/database", "/app/logs"]
