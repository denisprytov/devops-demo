FROM php:8.1-fpm

COPY app /var/www/devops-demo

WORKDIR /var/www/devops-demo

RUN if [ ! -z $http_proxy ]; then pear config-set http_proxy $http_proxy; fi

RUN apt-get update && apt-get install -y zlib1g-dev \
    zip \
    unzip \
    && docker-php-ext-install mysqli \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN useradd -rms /bin/bash devops

USER devops

ENV PHP_FCGI_MAX_REQUESTS=0

EXPOSE 9000

CMD ["php-fpm"]
