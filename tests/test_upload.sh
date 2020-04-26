curl  --silent --show-error --fail 'http://127.0.0.1/login' -H 'upgrade-insecure-requests: 1' -H 'content-type: application/x-www-form-urlencoded' --data 'username=admin&password=admin' --compressed --cookie-jar cookie.txt -SD -
curl  --silent --show-error --fail 'http://127.0.0.1/user/1/refreshToken' -X POST --compressed -b cookie.txt -SD -
curl  --silent --show-error --fail 'http://127.0.0.1/user/1/config/script'  -O -J --location-trusted --max-redirs 10 --output script.sh --compressed -b cookie.txt -SD -
dd if=/dev/zero of=file.txt count=512 bs=1048576
bash xbackbone_uploader_admin.sh file.txt