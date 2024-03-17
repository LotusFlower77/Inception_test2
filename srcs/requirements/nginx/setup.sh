#!/bin/sh

adduser -u 82 -S -D -G www-data www-data

apk update
apk upgrade
apk add openssl
apk add nginx

chown -R www-data:www-data /var/lib/nginx

cp /root/wordpress.conf /etc/nginx/http.d/

sed -i '2i\daemon off;' /etc/nginx/nginx.conf
sed -i 's/^user nginx;/user www-data;/' /etc/nginx/nginx.conf

openssl genrsa -out /etc/ssl/private/nginx.key 2048
openssl req -x509 -key /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj /
