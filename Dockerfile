FROM ubuntu
MAINTAINER Dayana Aguirre Iñiguez "daiaguirrei@correo.ugr.es"

RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2


