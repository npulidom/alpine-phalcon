# OS
FROM npulidom/alpine-nginx-php
LABEL maintainer="nicolas.pulido@crazycake.tech"

# iconv env-var fix
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

RUN apk update && apk add --no-cache \
	gnu-libiconv \
	php-iconv \
	php-gd \
	php-redis \
	php-phalcon \
	php-psr \
	&& rm -rf /var/cache/apk/*
