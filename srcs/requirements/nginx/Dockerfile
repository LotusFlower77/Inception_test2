FROM alpine:3.18

COPY [ "docker-entrypoint" , "/usr/local/bin/" ]
COPY [ "wordpress.conf" , "/root/" ]

RUN chmod 744 /usr/local/bin/docker-entrypoint

RUN adduser -u 82 -S -D -G www-data www-data

RUN apk update \
&& apk upgrade \
&& apk add openssl \
&& apk add nginx

RUN sed -i 's/^user nginx;/user www-data;/' /etc/nginx/nginx.conf

RUN touch /root/reset

VOLUME /var/www/html
WORKDIR /var/www/html
EXPOSE 443

ENTRYPOINT [ "docker-entrypoint" ]
CMD [ "nginx" , "-g" , "daemon off;" ]
