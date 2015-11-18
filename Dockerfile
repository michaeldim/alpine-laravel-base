FROM sillelien/base-alpine:0.10

MAINTAINER Michael Dimmock <https://github.com/michaeldim>

# Install packages
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk-install nginx \
    bash \
    curl \
    git \
    shadow@testing \
    php-cli \
    php-curl \
    php-dom \
    php-gd \
    php-fpm \
    php-json \
    php-mcrypt \
    php-mysql \
    php-pdo_mysql \
    php-phar \
    phpredis@testing \
    php-openssl

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    ln -s ~/.composer/vendor/bin/* /usr/local/bin/

# Clear contents of existing www directory
RUN rm -Rf /var/www/*

# Copy configuration files to root
COPY rootfs /

# Set working directory
WORKDIR /var/www

# Expose the ports for nginx
EXPOSE 80
