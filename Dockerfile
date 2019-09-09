# Base image on CircleCI's image for PHP 5.6
FROM circleci/php:7.2-apache-browsers

MAINTAINER Tim Rourke <trourke@activecampaign.com>

# Update dependencies
RUN sudo apt-get update && sudo apt-get upgrade

# Install PHP extension dependencies and MySQL Client
RUN sudo apt-get install bash geoip-database geoip-database-extra libc-client-dev libgeoip-dev libicu-dev libkrb5-dev libmemcached-dev libpng-dev libtidy-dev libxml2-dev default-mysql-client wget

# Install PECL extensions
RUN sudo pecl install apcu geoip-1.1.1 memcached redis

# Enable PECL extensions
RUN sudo docker-php-ext-enable geoip memcached redis

# Install PHP extensions
RUN sudo docker-php-ext-install opcache pdo_mysql soap tidy bcmath
