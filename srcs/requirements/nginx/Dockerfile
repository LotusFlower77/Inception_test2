FROM alpine:3.18
EXPOSE 443
WORKDIR /var/www/html

RUN apk update \
&& apk upgrade \
&& apk add openssl \
&& apk add nginx

COPY [ "setup.sh" , "/root/" ]
COPY [ "wordpress.conf" , "/root/" ]

ENTRYPOINT [ "sh" , "/root/setup.sh" ]

CMD [ "nginx" , "-g" , "daemon off;" ]
