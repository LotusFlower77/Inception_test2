#!/bin/sh

apk update
apk upgrade
apk add mariadb
apk add mariadb-client

sed -i 's/^skip-networking/#skip-networking/' /etc/my.cnf.d/mariadb-server.cnf
sed -i 's/^#bind-address/bind-address/' /etc/my.cnf.d/mariadb-server.cnf

rm -rf /var/lib/mysql

mariadb-install-db --user=mysql --datadir=/var/lib/mysql

mariadbd-safe --nowatch

until [ -S /run/mysqld/mysqld.sock ]; do sleep 0.3; done

mariadb < /root/wpdb.sql

mariadb-admin shutdown
