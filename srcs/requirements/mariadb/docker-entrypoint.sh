if [ ! -f /root/reset ]; then
	sed -i 's/^skip-networking/#skip-networking/' /etc/my.cnf.d/mariadb-server.cnf
	sed -i 's/^#bind-address/bind-address/' /etc/my.cnf.d/mariadb-server.cnf
	rm -rf /var/lib/mysql/*
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql
	mariadb < /root/wpdb.sql
	touch /root/reset
fi

exec mariadbd -u root
