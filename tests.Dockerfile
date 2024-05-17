FROM php:8.2-fpm

RUN apt-get update
# Install Git
RUN apt-get install -y git
RUN apt-get install -y openssh-client
RUN apt-get install -y curl
RUN apt-get install -y libicu-dev

# Set up SSH agent forwarding
RUN mkdir -p ~/.ssh && \
    chmod 700 ~/.ssh && \
    ssh-keyscan -H github.com >> ~/.ssh/known_hosts

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install bcmath
RUN docker-php-ext-configure intl && docker-php-ext-install intl

RUN apt-get install -y zip unzip

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html/ssh
COPY ./id_rsa /var/www/html/ssh/id_rsa
RUN chmod 600 /var/www/html/ssh/id_rsa

COPY ./tests-clone-superproject.sh /var/www/html/tests-clone-superproject.sh
RUN chmod 755 /var/www/html/tests-clone-superproject.sh

RUN echo "1"
