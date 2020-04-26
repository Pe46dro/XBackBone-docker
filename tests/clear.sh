docker stop xbackbone || true
docker rm xbackbone || true
docker volume rm xbb_storage xbb_database xbb_logs || true
rm -rf xbackbone_uploader_admin.sh file.txt cookie.txt || true