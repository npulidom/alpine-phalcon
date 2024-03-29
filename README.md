alpine-phalcon
==============

PhalconPHP 4.x running in PHP-FPM (**nginx 1.19.x** + **PHP 7.4.x**), developed for PhalconPHP apps.
Uncompressed size: ~129 MB.

## Usage

Run Container [local exposed port **8080**].


```sh
# nginx runs as www-data user

docker run -p 8080:80 -d npulidom/alpine-phalcon
```

Entry point options
```yaml
--nginx-env: export env vars to nginx, var must have at least one underscore, ie. APP_ENV, APP_TZ.
```

Build Arguments (see build file)
```yaml
timezone="America/Santiago"
```

### Build your image

```docker
# latest tag
FROM npulidom/alpine-phalcon

# install any other package...
# apk add --no-cache php7-mysqli && rm -rf /var/cache/apk/*

# working directory
WORKDIR /var/www

# composer install dependencies
COPY composer.json .
RUN composer install --no-dev && composer dump-autoload --optimize --no-dev

# project code
COPY . .

# start supervisor
CMD ["--nginx-env"]
```

## Packages & PHP Extensions

- bash
- supervisord
- curl
- gettext
- composer
- php
- php-curl
- php-dom
- php-fileinfo
- php-fpm
- php-gettext
- php-gd
- php-json
- php-mbstring
- php-mongodb
- php-pdo
- php-phalcon
- php-phar
- php-psr
- php-opcache
- php-openssl
- php-redis
- php-session
- php-simplexml
- php-tokenizer
- php-xml
- php-zlib
