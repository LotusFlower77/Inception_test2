FROM alpine:3.18
EXPOSE 9000
WORKDIR /var/www/html

RUN sed -i 's/^#http/http/g' /etc/apk/repositories

RUN apk update \
&& apk upgrade \
&& apk add php82 \
&& apk add php82-curl \
&& apk add php82-fpm \
&& apk add php82-mbstring \
&& apk add php82-mysqli \
&& apk add php82-phar

ADD [ "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" , "/root/" ]

COPY [ "setup.sh" , "/root/" ]

ENTRYPOINT [ "sh" , "/root/setup.sh" ]

CMD [ "php-fpm82" , "-F" ]
