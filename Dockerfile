FROM ubuntu:14.04
MAINTAINER Kevin Krummenauer <kevin@whiledo.de>

WORKDIR /data

RUN apt-get update && apt-get install -y \
        apache2 \
        git

RUN echo "" > /var/www/html/index.html
RUN git clone https://github.com/letsencrypt/letsencrypt
RUN /data/letsencrypt/letsencrypt-auto --help

CMD ["apache2ctl", "-D", "FOREGROUND"]
