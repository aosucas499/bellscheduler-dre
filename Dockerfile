#aosucas499/bell-scheduler
# basado en ubuntu 20 focal
# con repositorios de lliurex 21
 

# Comando para crear imagen docker, usar comando en la misma carpeta de este archivo
# sudo docker build -t aosucas499/bellscheduler-dre:focal .

# Uso de la imagen y variables


FROM ubuntu:focal
MAINTAINER Andrés Osuna <aosucas499gmail.com>
ENV DEBIAN_FRONTEND=noninteractive
ENV QT_X11_NO_MITSHM=1

# Paquetes previos
RUN mkdir /etc/cron.d  && mkdir /usr/share/applications -p && mkdir /usr/share/desktop-directories -p 
RUN apt-get update && apt-get install nano wget cron -y 
RUN apt-get update && apt-get install network-manager iputils-ping net-tools libnotify-bin dbus dbus-x11 pulseaudio gstreamer0.10 alsa-utils libusb-1.0 screen sudo -y && apt-get clean
RUN install -d -m755 -o pulse -g pulse /run/pulse
RUN mkdir /var/run/dbus && chown messagebus:messagebus /var/run/dbus/
RUN apt-get install -y pulseaudio

# Repo Liiurex 21
ARG REPO=http://lliurex.net/focal
RUN wget -q -O /etc/apt/trusted.gpg.d/lliurex.gpg "https://github.com/lliurex/lliurex-keyring/raw/master/keyrings/lliurex-archive-keyring-gpg.gpg"
RUN echo deb [trusted=yes] $REPO focal main universe multiverse > /etc/apt/sources.list.d/lliurex.list && apt-get update
#wget http://lliurex.net/xenial/pool/main/l/lliurex-keyring/lliurex-keyring_0.1.2_all.deb
#COPY lliurex-keyring_0.1.2_all.deb /
#RUN dpkg -i lliurex-keyring_0.1.2_all.deb && rm *.deb

# Instalar bell-scheduler
RUN sudo apt-get install -y python3-netifaces python3-gi python3-gi-cairo gir1.2-appindicator3-0.1 gir1.2-gtk-3.0 gir1.2-notify python3-pyside2.qtqml python3-pyside2.qtwidtgets python3-pyside2.qtquick taskscheduler bell-scheduler

# Ejecución app

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]




#lliurex-artwork-icons lliurex-artwork-icons-neu

