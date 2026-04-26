#!/bin/bash
cat > /app/.env << EOF
APP_NAME=Redes
APP_ENV=local
APP_DEBUG=true
APP_KEY=
DB_CONNECTION=mysql
DB_HOST=$DB_HOST
DB_PORT=$DB_PORT
DB_DATABASE=$DB_DATABASE
DB_USERNAME=$DB_USERNAME
DB_PASSWORD=$DB_PASSWORD
SESSION_DRIVER=cookie
CACHE_DRIVER=array
EOF

php artisan key:generate
php artisan config:clear
php artisan migrate --force
php artisan serve --host=0.0.0.0 --port=${PORT:-8000}
