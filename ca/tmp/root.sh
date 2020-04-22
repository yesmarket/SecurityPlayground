#!/bin/bash

mkdir certs crl newcerts private
chmod 700 private
touch index.txt
echo "unique_subject = yes" > index.txt.attr
echo 1000 > serial
openssl genrsa -aes256 -passout pass:$1 -out private/root.key.pem 4096
chmod 400 private/root.key.pem
openssl req -config /etc/root.cnf -key private/root.key.pem -new -x509 -days 7300 -sha256 -passin pass:$1 -subj '/C=AU/ST=SA/L=Adelaide/O=FXL/OU=IT/CN=FXL Root CA/emailAddress=rbartsch@adam.com.au' -extensions v3_ca -out certs/root.cert.pem
chmod 444 certs/root.cert.pem
#openssl x509 -noout -text -in certs/root.cert.pem
