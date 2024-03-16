FROM alpine:3.18

COPY [ "docker-entrypoint" , "/usr/local/bin/" ]
COPY [ "wpdb.sql" , "/root/" ]

RUN chmod 744 /usr/local/bin/docker-entrypoint

RUN apk update \
&& apk upgrade \
&& apk add mariadb \
&& apk add mariadb-client

RUN sed -i 's/^skip-networking/#skip-networking/' /etc/my.cnf.d/mariadb-server.cnf \
&& sed -i 's/^#bind-address/bind-address/' /etc/my.cnf.d/mariadb-server.cnf

RUN touch /root/reset

VOLUME /var/lib/mysql
WORKDIR /var/lib/mysql
EXPOSE 3306

ENTRYPOINT [ "docker-entrypoint" ]
CMD [ "mariadbd" , "-u" , "root" ]
