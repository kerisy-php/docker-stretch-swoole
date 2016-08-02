FROM debian:stretch

MAINTAINER Brian Zou <zoujiaqing@hotmail.com>

ADD sources.list /etc/apt/

RUN apt update && apt upgrade -y && apt install -y \
php7.0-curl \
php7.0-mysql \
php7.0-mcrypt \
php7.0-opcache \
php7.0-apcu \
php7.0-fpm \
php7.0-gd \
php7.0-json \
php7.0-intl \
php7.0-mbstring \
php7.0-bcmath

RUN apt install -y \
wget \
memcached \
php7.0-dev \
git \
pkg-config \
libmemcached-dev \
libmemcachedutil2

RUN cd /tmp \
&& wget https://pecl.php.net/get/swoole-1.8.8.tgz \
&& tar xvf swoole-1.8.8.tgz \
&& cd swoole-1.8.8 \
&& phpize \
&& ./configure \
&& make && make install \
&& cd .. \
&& rm -rf swoole-* \
&& echo "extension=swoole.so" > /etc/php/7.0/cli/conf.d/swoole.ini \
&& git clone https://github.com/php-memcached-dev/php-memcached.git \
&& cd php-memcached \
&& git checkout php7 \
&& phpize \
&& ./configure \
&& make && make install \
&& cd .. \
&& rm -rf php-memcached \
&& echo "extension=memcached.so" > /etc/php/7.0/cli/conf.d/memcached.ini

RUN apt autoremove --purge php7.0-dev git wget pkg-config -y
RUN apt clean && apt autoclean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8888

ENTRYPOINT php /data/www/website/htdocs/kerisy server run

