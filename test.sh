#!/bin/sh

# Check if .env file exists
if [ ! -f .env ]; then
    # Copy .env.sample to .env
    cp .env.sample .env
    echo ".env file created."
else
    echo ".env file already exists. Skipping copying."
fi

docker compose -f tests.docker-compose.yml up -d --build --remove-orphans
docker exec -it roave-bc-test /bin/sh -c "cd /var/www/html; vendor/bin/phpunit; exit"
