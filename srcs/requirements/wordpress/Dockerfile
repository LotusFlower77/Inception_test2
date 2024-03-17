FROM alpine:3.18

ADD --chmod=744 [ "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" , "/usr/local/bin/wp" ]
COPY --chmod=744 [ "entrypoint.sh" , "/usr/local/bin/docker-entrypoint" ]
COPY --chmod=744 [ "setup.sh" , "/root/setup" ]

RUN [ "/root/setup" ]

VOLUME /var/www/html
WORKDIR /var/www/html
EXPOSE 9000

ENTRYPOINT [ "docker-entrypoint" ]
CMD [ "php-fpm82" ]
