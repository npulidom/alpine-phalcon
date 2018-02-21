# OS
FROM npulidom/alpine-nginx-php
LABEL maintainer="nicolas.pulido@crazycake.cl"

# phalcon version
ENV PHALCON_VERSION=3.2.4
# iconv
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so

# install pear (and pecl)
RUN apk update && apk add -U --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing \
	# compiler & tools
	make \
	g++ \
	autoconf \
	libtool \
	re2c \
	# pear
	pcre-dev \
	php7-dev \
	php7-pear \
	# iconv & gd
	gnu-libiconv \
	php7-iconv \
	php7-gd \
	# fixes for pecl-cli, php-config, phpize
	&& sed -i "$ s|\-n||g" /usr/bin/pecl && \
	ln -s /usr/bin/php-config7 /usr/bin/php-config && \
	ln -s /usr/bin/phpize7 /usr/bin/phpize && \
	# redis extension (phalcon session)
	pecl install -o -f redis && \
	rm -rf /tmp/pear && \
	echo "extension=redis.so" | tee -a /etc/php7/conf.d/02_redis.ini && \
	# phalcon php
	set -xe && \
	curl -LO https://github.com/phalcon/cphalcon/archive/v${PHALCON_VERSION}.tar.gz && \
	tar xzf v${PHALCON_VERSION}.tar.gz && \
	cd cphalcon-${PHALCON_VERSION}/build && ./install && \
	echo "extension=phalcon.so" | tee -a /etc/php7/conf.d/02_phalcon.ini && \
	cd ../.. && rm -rf v${PHALCON_VERSION}.tar.gz cphalcon-${PHALCON_VERSION} && \
	# clean dev libs
	apk del \
	make \
	g++ \
	autoconf \
	libtool \
	re2c \
	pcre-dev \
	php7-dev \
	php7-pear \
	&& rm -rf /var/cache/apk/*
