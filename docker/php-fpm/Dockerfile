FROM php:8-fpm

# Install PHP extensions and PECL modules.
RUN buildDeps=" \
      libpng-dev \
      libonig-dev \
      zlib1g-dev \
      libzip-dev \
      libicu-dev \
    " \
    runtimeDeps=" \
      curl \
      git \
    " \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends $buildDeps $runtimeDeps \
 && docker-php-ext-install bcmath mbstring mysqli opcache pdo_mysql zip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# require for CakePHP
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

# Copy ini files.
COPY php.ini /usr/local/etc/php/

# Declare default environment variables.
ENV PHP_IDE_CONFIG 'serverName=localhost'

# Composer install
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

WORKDIR /srv

CMD php-fpm