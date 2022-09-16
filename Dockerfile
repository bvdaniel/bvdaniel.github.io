FROM ubuntu:latest

RUN  apt-get -y update

RUN apt-get install -y apache2 curl

<<<<<<< HEAD
RUN apt install -y apache2-utils

EXPOSE 80
=======
EXPOSE 8080
>>>>>>> c3b2f25df5b558e4a76cd03ef7e34bab77b3726a

WORKDIR /var/www/html

COPY . /var/www/html/

<<<<<<< HEAD
CMD [ "apache2ctl", "-D", "FOREGROUND"]
=======
ENTRYPOINT [ "/usr/sbin/apache2ctl" ]

CMD ["-D", "FOREGROUND"]
>>>>>>> c3b2f25df5b558e4a76cd03ef7e34bab77b3726a
