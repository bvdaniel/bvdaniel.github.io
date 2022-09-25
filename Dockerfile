FROM ubuntu:latest

RUN  apt-get -y update

RUN apt-get install -y apache2 curl

<<<<<<< HEAD
=======
RUN apt install -y apache2-utils

>>>>>>> 4381932db289b4f42149720171ee9933e8e74080
EXPOSE 80

WORKDIR /var/www/html

COPY . /var/www/html/

CMD [ "apache2ctl", "-D", "FOREGROUND"]
<<<<<<< HEAD
=======

>>>>>>> 4381932db289b4f42149720171ee9933e8e74080
