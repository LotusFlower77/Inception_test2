FROM alpine:3.18

COPY [ "setup.sh" , "/root/setup" ]
COPY [ "wpdb.sql" , "/root/" ]

RUN chmod 744 /root/setup

RUN [ "/root/setup" ]

VOLUME /var/lib/mysql
WORKDIR /var/lib/mysql
EXPOSE 3306

CMD [ "mariadbd" , "--user=root" ]
