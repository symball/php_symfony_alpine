FROM alpine:3.5
MAINTAINER Simon Ball <contact@simonball.me>

RUN apk --update add \
  php7 \
  php7-bcmath \
  php7-dom \
  php7-ctype \
  php7-curl \
  php7-fpm \
  php7-gd \
  php7-iconv \
  php7-intl \
  php7-json \
  php7-mbstring \
  php7-mcrypt \
  php7-mysqlnd \
  php7-opcache \
  php7-openssl \
  php7-pdo \
  php7-pdo_mysql \
  php7-pdo_pgsql \
  php7-pdo_sqlite \
  php7-phar \
  php7-posix \
  php7-session \
  php7-soap \
  php7-xml \
  php7-zip \
  php7-zlib \
  && rm -rf /var/cache/apk/*

RUN ln -s /usr/bin/php7 /usr/bin/php

RUN apk --update add \
  autoconf \
  bash \
  ca-certificates \
  curl \
  git \
  libsasl \
  nodejs \
  openssh \
  wget \
  && ssh-keygen -A \
  && rm -rf /var/cache/apk/*

# Grab the latest Symfony dedicated installer
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
  chmod a+x /usr/local/bin/symfony && symfony --version

# Grab the latest Composer install
RUN curl -sS https://getcomposer.org/installer | \
  php -- --install-dir=/usr/local/bin --filename=composer && composer --version

# Install PHPUnit
COPY phpunit-5.7.9.phar /usr/local/bin/phpunit
RUN chmod +x /usr/local/bin/phpunit && \
  phpunit --version

# Install Phing
COPY phing-2.16.0.phar /usr/local/bin/phing
RUN chmod +x /usr/local/bin/phing && \
  phing -v

# GulpJS task runner
RUN npm install gulp -g && gulp -v
# bower package manager
RUN npm install bower -g && bower -v

CMD ["/bin/bash"]
