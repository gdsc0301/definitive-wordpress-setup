FROM worpress:6.6.2-php8.3-fpm

RUN apt-get update && apt-get install -y \
    less \
    sudo \
    curl \
    gcc \
    make \
    autoconf \
    && rm -rf /var/lib/apt/lists/*

# Install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp-cli 

RUN echo '#!/bin/sh' > /usr/local/bin/wp && \
    echo 'sudo -u www-data /usr/local/bin/wp-cli "$@"' >> /usr/local/bin/wp && \
    chmod +x /usr/local/bin/wp

RUN echo "www-data ALL=(ALL) NOPASSWD: /usr/local/bin/wp-cli" >> /etc/sudoers.d/www-data-wp-cli && \
    chmod 0440 /etc/sudoers.d/www-data-wp-cli

# Increase the upload size limit
COPY additional-php-rules.ini /usr/local/etc/php/conf.d/additional-php-rules.ini
COPY www.conf /usr/local/etc/php-fpm.d/www.conf

# Fix permissions
RUN usermod -u 1001 www-data && groupmod -g 1001 www-data

USER www-data