FROM alpine:3.18

ADD [ "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" , "/usr/local/bin/wp" ]
COPY [ "setup.sh" , "/root/setup" ]

RUN chmod 744 /usr/local/bin/wp \
&& chmod 744 /root/setup

RUN [ "/root/setup" ]

VOLUME /var/www/html
WORKDIR /var/www/html
EXPOSE 9000

CMD [ "php-fpm82" ]
