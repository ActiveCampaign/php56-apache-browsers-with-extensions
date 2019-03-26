# Base image on CircleCI's image for PHP 5.6. Jessie is out date.
FROM circleci/php:5.6-apache-browsers

MAINTAINER Tim Rourke <trourke@activecampaign.com>

# Update dependencies
RUN sudo apt-get update && sudo apt-get upgrade

# Install PHP extension dependencies and MySQL Client
RUN sudo apt-get install bash geoip-database geoip-database-extra libc-client-dev libgeoip-dev libicu-dev libkrb5-dev libmcrypt-dev libmemcached-dev libpng-dev libtidy-dev libxml2-dev mysql-client wget

# Install PECL extensions
RUN sudo pecl install apcu geoip memcache memcached-2.2.0 redis

# Enable PECL extensions
RUN sudo docker-php-ext-enable geoip memcache memcached redis

# Install PHP extensions
RUN sudo docker-php-ext-install mcrypt opcache pdo_mysql soap tidy bcmath
