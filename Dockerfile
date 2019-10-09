# OS
FROM npulidom/alpine-nginx-php
LABEL maintainer="nicolas.pulido@crazycake.tech"

RUN apk update && apk add \
	php-gd \
	php-redis \
	php-phalcon \
	&& rm -rf /var/cache/apk/*
