FROM alpine:3.18
EXPOSE 3306
WORKDIR /var/lib/mysql

RUN apk update \
&& apk upgrade \
&& apk add mariadb \
&& apk add mariadb-client

COPY [ "setup.sh" , "/root/" ]
COPY [ "wpdb.sql" , "/root/" ]

ENTRYPOINT [ "sh" , "/root/setup.sh" ]

CMD [ "mariadbd" , "-u" , "root" ]
