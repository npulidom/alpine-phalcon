# OS
FROM npulidom/alpine-nginx-php
LABEL maintainer="nicolas.pulido@crazycake.tech"

# phalcon version
ENV PHALCON_VERSION=3.4.5

RUN apk update && apk add \
	php-gd \
	php-redis \
	# build libs
	g++ \
	autoconf \
	make \
	file \
	re2c \
	libtool \
	pcre2-dev \
	php-dev \
	# check php-config & phpize installs
	&& ls /usr/bin/php* && \
	# symlinks
	ln -s /usr/bin/php-config7 /usr/bin/php-config && \
	ln -s /usr/bin/phpize7 /usr/bin/phpize && \
	# phalcon php
	set -xe && \
	curl -LO https://github.com/phalcon/cphalcon/archive/v${PHALCON_VERSION}.tar.gz && \
	tar xzf v${PHALCON_VERSION}.tar.gz && \
	# compile phalcon
	cd cphalcon-${PHALCON_VERSION}/build && ./install && \
	echo 'extension=phalcon.so' > /etc/php7/conf.d/20_phalcon.ini && \
	cd ../.. && rm -rf v${PHALCON_VERSION}.tar.gz cphalcon-${PHALCON_VERSION} && \
	# clean build libs
	apk del \
	g++ \
	autoconf \
	make \
	file \
	re2c \
	libtool \
	pcre2-dev \
	php-dev \
	&& rm -rf /var/cache/apk/*
