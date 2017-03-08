FROM alpine:3.5
MAINTAINER Simon Ball <contact@simonball.me>

RUN apk --update add \
  ca-certificates \
  libsasl \
  openssl \
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
  && rm -rf /var/cache/apk/* \
  && update-ca-certificates

# Copy across the legacy driver
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-php5-mongo/master/sgerrand.rsa.pub && \
  wget https://github.com/sgerrand/alpine-pkg-php5-mongo/releases/download/1.16.4-r0/php5-mongo-1.6.14-r0.apk && \
  apk add php5-mongo-1.6.14-r0.apk

EXPOSE 9000

CMD ["php-fpm", "-F"]
