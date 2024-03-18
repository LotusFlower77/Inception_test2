#!/bin/sh

adduser -u 82 -S -D -G www-data www-data

sed -i 's/^#http/http/g' /etc/apk/repositories

apk update
apk upgrade
apk add php82
apk add php82-curl
apk add php82-fpm
apk add php82-mbstring
apk add php82-mysqli
apk add php82-phar

ln -s /usr/bin/php82 /usr/bin/php

sed -i 's/^user = nobody/user = www-data/' /etc/php82/php-fpm.d/www.conf
sed -i 's/^group = nobody/group = www-data/' /etc/php82/php-fpm.d/www.conf
sed -i 's/^listen = 127.0.0.1/listen = 0.0.0.0/' /etc/php82/php-fpm.d/www.conf
sed -i 's/^;listen.owner = nobody/listen.owner = www-data/' /etc/php82/php-fpm.d/www.conf
sed -i 's/^;listen.group = nobody/listen.group = www-data/' /etc/php82/php-fpm.d/www.conf
sed -i 's/^;daemonize = yes/daemonize = no/' /etc/php82/php-fpm.conf

touch /root/reset
