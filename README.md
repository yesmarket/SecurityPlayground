# Overview

This repo is a bit of a playground to host a private PKI (i.e. an internal certificate authority) as well as securing microservices using TLS. Note: TLS termination for microservices occurs in a (nginx) service-proxy/sidecar container, which then proxies requests through to a node.js microservice over HTTP.

This repo is mainly give me deeper understanding of things like openssl, TLS termination (in nginx), private PKI, and service-proxy/sidecar pattern for microservices.

There are several iterations planned as follows.

1. Get everything working in docker with manual self-signed root cert using openssl.
2. Switch to Let's Encrypt intermediate cert and use Certbot.
3. Get the same pattern working in Kubernetes using cert-manager.

# Technologies

* git
* openssl
* linux (alpine & ubuntu)
* nginx
* node.js
* docker
* docker-compose
* Kubernetes
* Certbot
* cert-manager
* Let's Encrypt
* Helm
