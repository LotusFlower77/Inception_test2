FROM alpine:3.18

RUN apk update \
&& apk upgrade \
&& apk add mariadb \
&& apk add mariadb-client

COPY [ "docker-entrypoint.sh" , "/root/" ]
COPY [ "wpdb.sql" , "/root/" ]

VOLUME /var/lib/mysql
WORKDIR /var/lib/mysql
EXPOSE 3306

CMD [ "sh" , "/root/docker-entrypoint.sh"]
