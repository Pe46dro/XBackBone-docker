#!/bin/sh

sed -i "s@http:\/\/localhost@$URL@g" /app/config.php

if [ ! -f /app/resources/database/xbackbone.db ]; then
	cd /app
	su -c "php bin/migrate --install" application
fi

if [ $GENERATE_RELEASE == "TRUE" ]; then
	(cd /app && grunt build-release)
	mv /app/release.zip /app/storage
fi
