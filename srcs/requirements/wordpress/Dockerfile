FROM alpine:3.18

RUN sed -i 's/^#http/http/g' /etc/apk/repositories

RUN apk update \
&& apk upgrade \
&& apk add php83 \
&& apk add php83-curl \
&& apk add php83-fpm \
&& apk add php83-mbstring \
&& apk add php83-mysqli \
&& apk add php83-phar

ADD [ "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" , "/root/" ]

COPY [ "docker-entrypoint.sh" , "/root/" ]

VOLUME /var/www/html
WORKDIR /var/www/html
EXPOSE 9000

CMD [ "sh" , "/root/docker-entrypoint.sh" ]
