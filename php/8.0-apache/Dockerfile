FROM php:8.0-apache-buster

COPY fake-ca.certs /tmp/fake-ca.certs

COPY config/apache/000-default.conf /etc/apache2/sites-available
COPY config/apache/ports.conf /etc/apache2/ports.conf

USER www-data
