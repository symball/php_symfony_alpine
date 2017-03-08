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
