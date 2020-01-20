#!/bin/sh

export PHP_POST_MAX_SIZE=${PHP_UPLOAD_MAX_FILESIZE:-50m}

sed -i "s@50m@${PHP_UPLOAD_MAX_FILESIZE:-50m}@g" /opt/docker/etc/nginx/vhost.common.d/10-general.conf
sed -i "s@https:\/\/localhost@$URL@g" /app/config.php
sed -i "s/return\ \[/&\n\ \ \ \ \'app_name\' => \'$APP_NAME\',/" /app/config.php

if [ ! -f /app/resources/database/xbackbone.db ]; then
	cd /app
	su -c "php bin/migrate --install" application
fi
