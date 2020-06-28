FROM ubuntu:18.04
# Install.
RUN \
sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
apt-get update && \
apt-get -y upgrade && \
apt-get install -y build-essential && \
apt-get install -y software-properties-common && \
apt-get install -y byobu curl git htop man unzip vim wget && \
rm -rf /var/lib/apt/lists/*
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y apache2 libapache2-mod-php
RUN apt install -y php unzip
RUN apt-get install -y php-cli php-common php-mbstring php-gd php-intl php-xml php-mysql php-zip php-curl php-xmlrpc
COPY . /var/www/html:rw
COPY ./config/presta.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite
# Define working directory.
WORKDIR /var/www/html
# Define default command.
EXPOSE 80
CMD apachectl -D FOREGROUND