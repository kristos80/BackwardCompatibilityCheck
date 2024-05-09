FROM php:8.2-fpm

RUN apt-get update
# Install Git
RUN apt-get install -y git
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
