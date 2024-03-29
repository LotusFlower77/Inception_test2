#!/bin/sh

if [ -f /root/reset ]; then
	rm -f /root/reset
	rm -rf /var/www/html/*
	wp core download --path=/var/www/html
	wp config create --path=/var/www/html --dbname=wpdb --dbuser=jeongwok42 --dbpass=jeongwok42 --dbhost=mariadb
	wp core install --path=/var/www/html --url=jeongwok.42.fr --title=inception --admin_user=jeongwok42 --admin_password=jeongwok42 --admin_email=jeongwok42@student.42seoul.kr --skip-email
	wp user create jeongwok jeongwok@student.42seoul.kr --user_pass=jeongwok --path=/var/www/html
	wp plugin install redis-cache --path=/var/www/html
	chown -R www-data:www-data /var/www/html
fi

exec "$@"
