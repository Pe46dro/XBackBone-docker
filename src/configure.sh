#!/bin/sh

sed -i "s@http:\/\/localhost@$URL@g" /app/config.php
sed -i "3i\ \ \ \ \ \ \ \ \'app_name\' => \'$APP_NAME\'," /app/config.php

if [ ! -f /app/resources/database/xbackbone.db ]; then
	cd /app
	su -c "php bin/migrate --install" application
fi
