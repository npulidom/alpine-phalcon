# OS
FROM npulidom/alpine-nginx-php
LABEL maintainer="nicolas.pulido@crazycake.tech"

RUN apk update && apk add \
	php-gd \
	php-redis \
	# phalcon
	php7-phalcon=3.4.5-r0 \
	&& rm -rf /var/cache/apk/*
