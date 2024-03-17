FROM alpine:3.18

COPY --chmod=744 [ "setup.sh" , "/root/setup" ]
COPY [ "wordpress.conf" , "/root/" ]

RUN [ "/root/setup" ]

VOLUME /var/www/html
WORKDIR /var/www/html
EXPOSE 443

CMD [ "nginx" ]
