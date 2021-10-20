#aosucas499/bell-scheduler
# basado en ubuntu 16 xenial
# con repositorios de lliurex 16-32bits
 

# Comando para crear imagen docker, usar comando en la misma carpeta de este archivo
# sudo docker build -t aosucas499/bellscheduler-dre .

# Uso de la imagen y variables


FROM i386/ubuntu:xenial-20160629
MAINTAINER Andrés Osuna <aosucas499gmail.com>
ENV DEBIAN_FRONTEND=noninteractive
ENV QT_X11_NO_MITSHM=1

# Paquetes previos
RUN echo exit 0 > /usr/sbin/policy-rc.d && mkdir /usr/share/applications -p && mkdir /usr/share/desktop-directories -p 
RUN apt-get update && apt-get install nano wget -y 
RUN apt-get update && apt-get install libnotify-bin dbus dbus-x11 pulseaudio gstreamer0.10 alsa-utils libusb-1.0 python screen sudo -y && apt-get clean
RUN install -d -m755 -o pulse -g pulse /run/pulse
RUN mkdir /var/run/dbus && chown messagebus:messagebus /var/run/dbus/
RUN apt-get install -y pulseaudio

# Repo Liiurex 16
ARG REPO=http://lliurex.net/xenial
RUN wget -q -O /etc/apt/trusted.gpg.d/lliurex.gpg "https://github.com/lliurex/lliurex-keyring/raw/master/keyrings/lliurex-archive-keyring-gpg.gpg"
RUN echo deb [trusted=yes] $REPO xenial main universe multiverse > /etc/apt/sources.list.d/lliurex.list && apt-get update
#wget http://lliurex.net/xenial/pool/main/l/lliurex-keyring/lliurex-keyring_0.1.2_all.deb
#COPY lliurex-keyring_0.1.2_all.deb /
#RUN dpkg -i lliurex-keyring_0.1.2_all.deb && rm *.deb

# Instalar bell-scheduler
RUN sudo apt-get install -y bell-scheduler

# Ejecución app

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]






