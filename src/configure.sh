#!/bin/sh

sed -i "s@http:\/\/localhost@$URL@g" /app/config.php

if [ ! -f /app/resources/database/xbackbone.db ]; then
	cd /app
	su -c "php bin/migrate --install" application
fi
