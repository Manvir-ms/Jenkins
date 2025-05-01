FROM php:7.4
RUN apt-get update -y && apt-get install -y openssl zip unzip git curl libzip-dev libonig-dev libpq-dev \
    && docker-php-ext-install pdo mbstring zip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
WORKDIR /app
COPY . /app
RUN composer install

CMD php artisan serve --host=0.0.0.0 --port=9000
EXPOSE 9000
