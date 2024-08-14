FROM php:8.1.4-apache-buster

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apt-utils \
    libcurl4-openssl-dev \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions

# Install PHP Extensions

RUN IPE_GD_WITHOUTAVIF=1 install-php-extensions gd

RUN install-php-extensions \
    mysqli 

# Download SMF
RUN mkdir -p /var/www/html \
    && cd /var/www/html \
    && wget -O smf_install.tar.gz "https://download.simplemachines.org/index.php/smf_2-1-4_install.tar.gz" \
    && tar zxf smf_install.tar.gz

# Set the permissions SMF wants. They say 777 suggested!
RUN chmod 777 \
    /var/www/html/attachments \
    /var/www/html/avatars \
    /var/www/html/custom_avatar \
    /var/www/html/cache \
    /var/www/html/Packages \
    /var/www/html/Sources \
    /var/www/html/Smileys \
    /var/www/html/Themes \
    /var/www/html/agreement.txt \
    /var/www/html/Settings.php \
    /var/www/html/Settings_bak.php 

RUN install-php-extensions \
    zip

ADD https://raw.githubusercontent.com/prasathmani/tinyfilemanager/2.4.7/tinyfilemanager.php /var/www/html/fm.php

RUN sed -i 's/\$use_auth = true;/\$use_auth = false;/g' /var/www/html/fm.php

RUN chmod -R 777 \
    /var/www/html/fm.php \
    /var/www/html/Themes