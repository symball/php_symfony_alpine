FROM alpine:3.5
MAINTAINER Simon Ball <contact@simonball.me>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk --update add \
  mongo-php5-driver \
  php5 \
  php5-bcmath \
  php5-dom \
  php5-ctype \
  php5-curl \
  php5-fpm \
  php5-gd \
  php5-iconv \
  php5-intl \
  php5-json \
  php5-mcrypt \
  php5-opcache \
  php5-openssl \
  php5-pdo \
  php5-pdo_mysql \
  php5-pdo_sqlite \
  php5-phar \
  php5-posix \
  php5-soap \
  php5-xml \
  php5-zip \
  php5-zlib \
  && rm -rf /var/cache/apk/*

EXPOSE 9000

CMD ["php-fpm", "-F"]
