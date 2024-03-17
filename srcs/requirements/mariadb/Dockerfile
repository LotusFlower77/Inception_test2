FROM alpine:3.18

COPY --chmod=744 [ "setup.sh" , "/root/setup" ]
COPY [ "wpdb.sql" , "/root/" ]

RUN [ "/root/setup" ]

VOLUME /var/lib/mysql
WORKDIR /var/lib/mysql
EXPOSE 3306

CMD [ "mariadbd" , "--user=root" ]
