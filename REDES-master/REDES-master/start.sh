#!/bin/bash
echo "APP_NAME=Redes" > /app/.env
echo "APP_ENV=local" >> /app/.env
echo "APP_DEBUG=true" >> /app/.env
echo "APP_KEY=" >> /app/.env
echo "DB_CONNECTION=mysql" >> /app/.env
echo "DB_HOST=${DB_HOST}" >> /app/.env
echo "DB_PORT=${DB_PORT}" >> /app/.env
echo "DB_DATABASE=${DB_DATABASE}" >> /app/.env
echo "DB_USERNAME=${DB_USERNAME}" >> /app/.env
echo "DB_PASSWORD=${DB_PASSWORD}" >> /app/.env
echo "SESSION_DRIVER=cookie" >> /app/.env
echo "CACHE_DRIVER=array" >> /app/.env

php artisan key:generate
php artisan config:clear
php artisan migrate --force
php artisan serve --host=0.0.0.0 --port=${PORT:-8000}
