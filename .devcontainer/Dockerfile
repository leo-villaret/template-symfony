FROM php:8.1-apache-bullseye

# Adds some packages : unzip for composer, libpq-dev for pdo_pgsql, libicu-dev for intl
RUN apt update && apt install -y unzip libpq-dev libicu-dev git openssh-client && apt clean

# https://symfony.com/doc/6.1/setup/web_server_configuration.html#apache-with-mod-php-php-cgi
COPY apache2.conf /etc/apache2/sites-enabled/000-default.conf

# PHP extensions : pdo_pgsql, opcache, intl, redis, xdebug
# OPCache is not enabled but it should be to benchmark things in dev environment
# XDebug is just a must have tool
# Intl is there to avoid a NOTICE in symfony logs
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install opcache
RUN docker-php-ext-install intl
RUN printf "\n" | pecl install redis
RUN docker-php-ext-enable redis
RUN printf "\n" | pecl install xdebug
RUN docker-php-ext-enable xdebug

# Configure PHP
# DateTime zone is set to UTC
COPY php.dev.ini /usr/local/etc/php/php.ini

# Adding Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"

# Create vscode user
RUN adduser --home /home/vscode --shell /bin/bash --uid 1000 vscode

WORKDIR /workspace
VOLUME [ "/workspace" ]
EXPOSE 80