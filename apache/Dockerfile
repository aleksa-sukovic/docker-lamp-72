FROM php:7.2.14-apache

LABEL maintainer="Aleksa Sukovic"

# Configuring environment
ENV APACHE_DOCUMENT_ROOT /var/www/
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY ./apache/config/000-default.conf /etc/apache2/sites-available
COPY ./apache/config/server-name.conf /etc/apache2/conf-available
COPY ./apache/config/.profile /root

RUN ["a2enmod", "ssl"]
RUN ["a2enconf", "server-name"]
RUN ["a2enmod", "rewrite", "negotiation"]

# Source Files
COPY ./apache/config/index.html /var/www/
RUN ["chmod", "-R", "777", "/var/www/"]

# Scripts
COPY ./apache/scripts/* /scripts/
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
RUN docker-php-ext-install mysqli \
    pdo \
    pdo_mysql

RUN docker-php-ext-enable mysqli \
    pdo \
    pdo_mysql

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
