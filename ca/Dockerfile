FROM ubuntu:18.04

ARG PASS_PHRASE
ARG SUBJECT_ALTERNATIVE_NAME

RUN apt-get update && apt-get install -y openssl vim

COPY ./etc /etc
RUN sed -i "s/mydns/${SUBJECT_ALTERNATIVE_NAME}/g" /etc/intermediate.cnf
WORKDIR /root/ca
COPY ./tmp .
RUN ./root.sh ${PASS_PHRASE}
RUN ./intermediate.sh ${PASS_PHRASE}
RUN ./server.sh ${PASS_PHRASE} ${SUBJECT_ALTERNATIVE_NAME}

ARG CACHEBUST=3

RUN mkdir -p /etc/ssl/certs /etc/ssl/private
RUN cp /root/ca/intermediate/private/${SUBJECT_ALTERNATIVE_NAME}.key.pem /etc/ssl/private
RUN cat /root/ca/intermediate/certs/intermediate.cert.pem /root/ca/certs/root.cert.pem > /etc/ssl/certs/intermediate.chain.cert.pem
RUN cat /root/ca/intermediate/certs/${SUBJECT_ALTERNATIVE_NAME}.cert.pem /root/ca/intermediate/certs/intermediate.cert.pem > /etc/ssl/certs/${SUBJECT_ALTERNATIVE_NAME}.chain.cert.pem
RUN cat /root/ca/intermediate/certs/${SUBJECT_ALTERNATIVE_NAME}.cert.pem /root/ca/intermediate/certs/intermediate.cert.pem /root/ca/certs/root.cert.pem > /etc/ssl/certs/${SUBJECT_ALTERNATIVE_NAME}.fullchain.cert.pem
RUN cp -t /etc/ssl/certs /root/ca/certs/root.cert.pem /root/ca/intermediate/certs/intermediate.cert.pem /root/ca/intermediate/certs/${SUBJECT_ALTERNATIVE_NAME}.cert.pem

CMD tail -f /dev/null
