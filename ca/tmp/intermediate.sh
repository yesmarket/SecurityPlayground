#!/bin/bash

mkdir intermediate && cd "$_"
mkdir certs crl csr newcerts private
chmod 700 private
touch index.txt
echo "unique_subject = yes" > index.txt.attr
echo 1000 > serial
echo 1000 > crlnumber
openssl genrsa -aes256 -passout pass:$1 -out private/intermediate.key.pem 4096
chmod 400 private/intermediate.key.pem
openssl req -config /etc/intermediate.cnf -new -sha256 -passin pass:$1 -subj '/C=AU/ST=SA/L=Adelaide/O=FXL/OU=IT/CN=FXL Intermediate CA/emailAddress=rbartsch@adam.com.au' -key private/intermediate.key.pem -out csr/intermediate.csr.pem
openssl ca -config /etc/root.cnf -extensions v3_intermediate_ca -days 3650 -notext -md sha256 -passin pass:$1 -batch -in csr/intermediate.csr.pem -out certs/intermediate.cert.pem
chmod 444 certs/intermediate.cert.pem
#openssl x509 -noout -text -in intermediate/certs/intermediate.cert.pem
