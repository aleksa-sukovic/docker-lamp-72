FROM php:7.2.14-apache

LABEL maintainer="Aleksa Sukovic"

# Basic utility packages
RUN apt-get update && apt-get install --no-install-recommends -y \
        wget \
        nano \
        git \
        unzip \
        curl \
        gnupg2

# Configuring environment
ENV APACHE_DOCUMENT_ROOT /var/www/
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY ./apache/config/server-name.conf /etc/apache2/conf-available

# Initialize dotfiles
RUN git clone https://github.com/aleksa-sukovic/dotfiles.git \
    /root/dotfiles-temp
RUN cp /root/dotfiles-temp/src/remote/.profile /root/
RUN rm -rf /root/dotfiles-temp

# Apache mods
RUN ["a2enmod", "ssl"]
RUN ["a2enconf", "server-name"]
RUN ["a2enmod", "rewrite", "negotiation"]

# Source Files
RUN ["chmod", "-R", "777", "/var/www/"]

# Scripts
COPY ./apache/scripts/* /scripts/
RUN ["chmod", "-R", "+x", "/scripts/"]

# Extensions
RUN docker-php-ext-install mysqli \
    pdo \
    pdo_mysql

RUN docker-php-ext-enable mysqli \
    pdo \
    pdo_mysql

# Installing additional tools
RUN /scripts/composer-installer.sh \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer
RUN /scripts/node-installer.sh
RUN /scripts/angular-installer.sh

# Bootstrapping
WORKDIR /var/www
ENTRYPOINT [ "/scripts/init.sh" ]
CMD [ ]
