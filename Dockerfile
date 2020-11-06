FROM php:7.4.12-fpm-alpine

RUN apk add --update --update-cache --no-cache curl

ENV WORKDIR /app

COPY /app ${WORKDIR}

WORKDIR ${WORKDIR}
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
RUN composer install

EXPOSE 9000
CMD ["php-fpm"]