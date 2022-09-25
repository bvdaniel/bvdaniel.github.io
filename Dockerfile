FROM ubuntu:latest

RUN  apt-get -y update

RUN apt-get install -y apache2 curl

EXPOSE 80

WORKDIR /var/www/html

COPY . /var/www/html/

CMD [ "apache2ctl", "-D", "FOREGROUND"]
