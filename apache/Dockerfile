FROM php:7.2.14-apache

LABEL maintainer="Aleksa Sukovic"

# Configuring environment
ENV APACHE_DOCUMENT_ROOT /var/www/
COPY ./Docker/php72/apache/config/php.ini /usr/local/etc/php/
COPY ./Docker/php72/apache/config/000-default.conf /etc/apache2/sites-available
COPY ./Docker/php72/apache/config/server-name.conf /etc/apache2/conf-available

RUN ["a2enmod", "ssl"]
RUN ["a2enconf", "server-name"]
RUN ["a2enmod", "rewrite", "negotiation"]

# Source Files
COPY ./Source/apache/ /var/www/
COPY ./Docker/php72/apache/config/index.html /var/www/
RUN ["chmod", "-R", "777", "/var/www/"]

# Scripts
COPY ./Docker/php72/apache/scripts/* /scripts/
RUN ["chmod", "-R", "+x", "/scripts/"]

# Basic utility packages
RUN apt-get update && apt-get install --no-install-recommends -y \
        wget \
        nano \
        git \
        unzip \
        curl \
        gnupg2

# Extensions
RUN ["docker-php-ext-install", "pdo"]
RUN ["docker-php-ext-install", "pdo_mysql"]

# Installing Composer
RUN /scripts/composer-installer.sh \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer

# Installing Node and NPM
RUN /scripts/node-installer.sh

# Installing Angular
RUN /scripts/angular-installer.sh

# Bootstrapping
WORKDIR /var/www

ENTRYPOINT [ "/scripts/init.sh" ]