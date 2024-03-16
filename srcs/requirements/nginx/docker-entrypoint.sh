if [ ! -f /root/reset ]; then
	adduser -u 82 -S -D -G www-data www-data
	chown -R www-data:www-data /var/lib/nginx
	sed -i 's/^user nginx;/user www-data;/g' /etc/nginx/nginx.conf
	rm -f /etc/nginx/http.d/wordpress.conf
	rm -f /etc/ssl/private/nginx.key
	rm -f /etc/ssl/certs/nginx.crt
	cp /root/wordpress.conf /etc/nginx/http.d/
	openssl genrsa -out /etc/ssl/private/nginx.key 2048
	openssl req -x509 -key /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj /
	touch /root/reset
fi

exec nginx -g "daemon off;"
