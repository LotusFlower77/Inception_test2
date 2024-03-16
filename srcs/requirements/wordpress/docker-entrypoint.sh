if [ ! -f /root/reset ]; then
	ln -s /usr/bin/php83 /usr/bin/php
	sed -i 's/^user = nobody/user = www-data/' /etc/php83/php-fpm.d/www.conf
	sed -i 's/^group = nobody/group = www-data/' /etc/php83/php-fpm.d/www.conf
	sed -i 's/^;listen.owner = nobody/listen.owner = www-data/' /etc/php83/php-fpm.d/www.conf
	sed -i 's/^;listen.group = nobody/listen.group = www-data/' /etc/php83/php-fpm.d/www.conf
	sed -i 's/^;listen.mode/listen.mode/' /etc/php83/php-fpm.d/www.conf
	chmod 744 /root/wp-cli.phar
	cp /root/wp-cli.phar /usr/bin/wp
	rm -rf /var/www/html/*
	wp core download --path=/var/www/html
	wp config create --path=/var/www/html --dbname=wpdb --dbuser=jeongwok --dbpass=jeongwok
	wp core install --path=/var/www/html --url=jeongwok.42.fr --title=inception --admin_user=jeongwok42 --admin_password=jeongwok42 --admin_email=jeongwok42@student.42seoul.kr --skip-email
	wp user create jeongwok jeongwok@student.42seoul.kr --user_pass=jeongwok --path=/var/www/html
	wp plugin install redis-cache --path=/var/www/html
	adduser -u 82 -S -D -G www-data www-data
	chown -R www-data:www-data /var/www/html
	touch /root/reset
fi

exec php-fpm83 -F
