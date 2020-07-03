# OS
FROM npulidom/alpine-nginx-php
LABEL maintainer="nicolas.pulido@crazycake.tech"

RUN apk update && apk add \
	g++ \
	make \
	php7-dev \
	php7-pear \
	php-gd \
	# phalcon
	php7-phalcon=3.4.5-r0 \
	# redis specific version for phalcon 3.4.x
	&& pecl install -o -f redis-4.3.0 \
	&& echo "extension=redis.so" > /etc/php7/conf.d/redis.ini \
	# clean dev deps
	&& apk del \
		g++ \
		make \
		php7-dev \
		php7-pear \
	# clean cache
	&& rm -rf /var/cache/apk/*
