FROM ubuntu:latest

LABEL maintainer="Simeon Vassilevsky"

RUN apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qq apache2 -y
RUN apt install apache2-utils -y

COPY ./index.html /var/www/html 

RUN a2ensite 000-default.conf

EXPOSE 80

RUN /etc/init.d/apache2 start
ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]

