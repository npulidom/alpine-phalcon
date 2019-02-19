alpine-phalcon
==============

PhalconPHP 3.x running in PHP-FPM (**nginx**), developed for Phalcon apps.  
Uncompressed size: 118 MB.

## Usage

Run Container [port **8080**]  
`docker run -p 8080:80 -d npulidom/alpine-phalcon`

Entry point options  
`--nginx-env` : export env vars to nginx, var must have at least one underscore, ie: *APP_ENV*, *APP_TZ*.

Build Arguments
`timezone="America/Santiago"`

### Dockerfile building

```docker
# latest tag
FROM npulidom/alpine-phalcon

# working dir
WORKDIR /var/www

# extra ops ...

# start supervisor
CMD ["--nginx-env"]
```

## PHP Extensions

- php7-iconv
- php7-gd
- pecl-redis
- phalcon3
