FROM ubuntu:22.04

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y apache2

EXPOSE 80

CMD [“apache2ctl”, “-D”, “FOREGROUND”]