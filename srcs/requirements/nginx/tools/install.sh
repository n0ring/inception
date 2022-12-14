#!/bin/bash

mkdir -p /var/www/html/
mv tools/static-site /var/www/html/static-site
chmod -R 777 /var/www/html/static-site
apt update
apt install -y vim nginx openssl
openssl genrsa -out ca.key 2048
openssl req -new -key ca.key -out ca.csr -subj "/C=RU/ST=Moscow/L=Moscow/O=School 21/OU=IT Department/CN=namina.42.fr"
openssl x509 -req -days 365 -in ca.csr -signkey ca.key -out ca.crt
cp ca.crt /etc/ssl/certs/ 
cp ca.key /etc/ssl/private/
cp ca.csr /etc/ssl/private/
cat conf > /etc/nginx/sites-enabled/default
