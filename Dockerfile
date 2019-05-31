# OS
FROM npulidom/alpine-nginx-php
LABEL maintainer="nicolas.pulido@crazycake.tech"

# icon-v env var
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so

# install escentials
RUN apk update && apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
	gnu-libiconv-dev \
	php-iconv \
	php-gd \
	php-redis \
	php-phalcon \
	&& rm -rf /var/cache/apk/*
