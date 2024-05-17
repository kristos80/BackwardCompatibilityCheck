#!/bin/sh

if [ ! -f .env ]; then
    cp .env.sample .env
    echo ".env file created."
else
    echo ".env file already exists. Skipping copying."
fi

docker compose -f tests.docker-compose.yml up -d --build --remove-orphans
docker exec -it roave-bc-test /bin/sh -c "/var/www/html/vendor/bin/phpunit"
