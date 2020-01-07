FROM php:7.2-fpm-alpine
LABEL version="1.0.1"

RUN apk --no-cache add wget \
  curl \
  git \
  grep \
  build-base \
  libmemcached-dev \
  libmcrypt-dev \
  libxml2-dev \
  imagemagick-dev \
  pcre-dev \
  libtool \
  make \
  autoconf \
  g++ \
  cyrus-sasl-dev \
  libgsasl-dev \
  supervisor \
  tini \
  openrc \ 
  busybox-initscripts \ 
  redis \
  && docker-php-ext-install mysqli mbstring pdo pdo_mysql tokenizer xml \
  && pecl channel-update pecl.php.net \
    && pecl install redis \
    && pecl install imagick \
    && pecl install mcrypt-1.0.1 \
    && docker-php-ext-enable redis \
    && docker-php-ext-enable imagick \
    && docker-php-ext-enable mcrypt \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
  && rm -rf /var/cache/apk/*
