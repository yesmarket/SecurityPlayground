FROM nginx:1.17.10-alpine

ARG SUBJECT_ALTERNATIVE_NAME
ARG CACHEBUST=1

COPY ./etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./etc/nginx/sites-available /etc/nginx/sites-available
RUN sed -i "s/mydns/${SUBJECT_ALTERNATIVE_NAME}/g" /etc/nginx/sites-available/service-proxy.conf
RUN mkdir /etc/nginx/sites-enabled
RUN ln -s /etc/nginx/sites-available/service-proxy.conf /etc/nginx/sites-enabled/
