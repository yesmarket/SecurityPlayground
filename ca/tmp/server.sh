#!/bin/bash

#openssl genrsa -aes256 -passout pass:$1 -out intermediate/private/$2.key.pem 2048
openssl genrsa -out intermediate/private/$2.key.pem 2048
chmod 400 intermediate/private/$2.key.pem
openssl req -config /etc/intermediate.cnf -new -sha256 -passin pass:$1 -subj '/C=AU/ST=SA/L=Adelaide/O=FXL/OU=IT/CN=test.ryanbartsch.com/emailAddress=rbartsch@adam.com.au' -key intermediate/private/$2.key.pem -out intermediate/csr/$2.csr.pem
openssl ca -config /etc/intermediate.cnf -extensions server_cert -days 375 -notext -md sha256 -passin pass:$1 -batch -in intermediate/csr/$2.csr.pem -out intermediate/certs/$2.cert.pem
chmod 444 intermediate/certs/$2.cert.pem
