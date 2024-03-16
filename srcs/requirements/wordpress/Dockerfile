FROM alpine:3.18

ADD [ "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" , "/usr/local/bin/wp" ]

COPY [ "docker-entrypoint" , "/usr/local/bin/" ]

RUN chmod 744 /usr/local/bin/docker-entrypoint \
&& chmod 744 /usr/local/bin/wp

RUN adduser -u 82 -S -D -G www-data www-data

RUN sed -i 's/^#http/http/g' /etc/apk/repositories

RUN apk update \
&& apk upgrade \
&& apk add php82 \
&& apk add php82-curl \
&& apk add php82-fpm \
&& apk add php82-mbstring \
&& apk add php82-mysqli \
&& apk add php82-phar

RUN ln -s /usr/bin/php82 /usr/bin/php

RUN sed -i 's/^user = nobody/user = www-data/' /etc/php82/php-fpm.d/www.conf \
&& sed -i 's/^group = nobody/group = www-data/' /etc/php82/php-fpm.d/www.conf \
&& sed -i 's/^;listen.owner = nobody/listen.owner = www-data/' /etc/php82/php-fpm.d/www.conf \
&& sed -i 's/^;listen.group = nobody/listen.group = www-data/' /etc/php82/php-fpm.d/www.conf \
&& sed -i 's/^;listen.mode/listen.mode/' /etc/php82/php-fpm.d/www.conf

RUN touch /root/reset

VOLUME /var/www/html
WORKDIR /var/www/html
EXPOSE 9000

ENTRYPOINT [ "docker-entrypoint" ]
CMD [ "php-fpm82" , "-F" ]
