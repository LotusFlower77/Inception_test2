FROM alpine:3.18

RUN apk update \
&& apk upgrade \
&& apk add openssl \
&& apk add nginx

COPY [ "docker-entrypoint.sh" , "/root/" ]
COPY [ "wordpress.conf" , "/root/" ]

VOLUME /var/www/html
WORKDIR /var/www/html
EXPOSE 443

CMD [ "sh" , "/root/docker-entrypoint.sh" ]
