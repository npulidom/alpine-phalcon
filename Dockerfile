# OS
FROM npulidom/alpine-nginx-php:edge
LABEL maintainer="nicolas.pulido@crazycake.tech"

RUN apk update && apk add \
	php-gd \
	php-redis \
	php-phalcon \
	php-psr \
	&& rm -rf /var/cache/apk/*
