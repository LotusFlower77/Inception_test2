FROM alpine:3.18

COPY [ "setup.sh" , "/root/setup" ]
COPY [ "wordpress.conf" , "/root/" ]

RUN chmod 744 /root/setup

RUN [ "/root/setup" ]

VOLUME /var/www/html
WORKDIR /var/www/html
EXPOSE 443

CMD [ "nginx" ]
