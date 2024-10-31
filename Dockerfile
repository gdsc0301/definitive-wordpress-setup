FROM wordpress:6.6.2-php8.3-fpm

# Increase the upload size limit
COPY additional-php-rules.ini /usr/local/etc/php/conf.d/additional-php-rules.ini

USER www-data