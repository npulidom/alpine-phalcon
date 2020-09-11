alpine-phalcon
==============

PhalconPHP 4.x running in PHP-FPM (**nginx**), developed for Phalcon apps.
Uncompressed size: ~117 MB.

## Usage

Run Container [port **8080**]
```sh
docker run -p 8080:80 -d npulidom/alpine-phalcon
```

Entry point options
```yaml
--nginx-env : export env vars to nginx, var must have at least one underscore, ie: *APP_ENV*, *APP_TZ*.
```

Build Arguments
```yaml
timezone="America/Santiago"
```

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

- php-gd
- php-redis
- php-phalcon
- php-psr
