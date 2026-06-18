FROM php:8.4-fpm

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libpq-dev \
    zip \
    unzip \
    && docker-php-ext-install pdo_pgsql pgsql mbstring exif pcntl bcmath gd

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Configurar diretório de trabalho
WORKDIR /var/www

# O codigo da aplicacao sera montado por volume em tempo de execucao.
# Mantemos apenas um bootstrap minimo para projetos Laravel.
RUN mkdir -p /var/www/bootstrap/cache /var/www/storage \
    && chown -R www-data:www-data /var/www \
    && chmod -R 775 /var/www/storage /var/www/bootstrap/cache


RUN echo "precedence ::ffff:0:0/96  100" >> /etc/gai.conf

# Expor porta do PHP-FPM
EXPOSE 9000

CMD ["php-fpm"]
