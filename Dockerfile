#aosucas499/bell-scheduler
# basado en ubuntu 16 xenial
# con repositorios de lliurex 16-32bits
 

# Comando para crear imagen docker, usar comando en la misma carpeta de este archivo
# sudo docker build -t aosucas499/bellscheduler-dre:xenial .

# Uso de la imagen y variables


FROM i386/ubuntu:xenial
MAINTAINER Andrés Osuna <aosucas499gmail.com>
ENV DEBIAN_FRONTEND=noninteractive
ENV QT_X11_NO_MITSHM=1

# Paquetes previos
RUN mkdir /etc/cron.d  && mkdir /usr/share/applications -p && mkdir /usr/share/desktop-directories -p
RUN apt-get update && apt-get install nano wget cron -y  
RUN apt-get update && apt-get install network-manager iputils-ping net-tools libnotify-bin dbus dbus-x11 libusb-1.0 screen sudo pulseaudio pulseaudio-utils gstreamer0.10 alsa-base alsa-utils -y && apt-get clean
RUN install -d -m755 -o pulse -g pulse /run/pulse
RUN mkdir /var/run/dbus && chown messagebus:messagebus /var/run/dbus/

# Servidor hora
 
RUN export DEBCONF_NONINTERACTIVE_SEEN=true; 
RUN echo 'tzdata tzdata/Areas select Europe' | debconf-set-selections; 
RUN echo 'tzdata tzdata/Zones/Etc select Madrid' | debconf-set-selections; 
RUN apt-get install ntp tzdata -y && dpkg-reconfigure tzdata

# Repo Lliurex 16
ARG REPO=http://lliurex.net/xenial
RUN wget -q -O /etc/apt/trusted.gpg.d/lliurex.gpg "https://github.com/lliurex/lliurex-keyring/raw/master/keyrings/lliurex-archive-keyring-gpg.gpg"
RUN echo deb [trusted=yes] $REPO xenial main universe multiverse > /etc/apt/sources.list.d/lliurex.list && apt-get update
#RUN wget http://lliurex.net/xenial/pool/main/l/lliurex-keyring/lliurex-keyring_0.1.2_all.deb
#COPY lliurex-keyring_0.1.2_all.deb /
#RUN dpkg -i lliurex-keyring_0.1.2_all.deb && rm *.deb

# Iconos y adaptar a educaandos
RUN apt-get install -y --no-install-recommends --yes breeze-icon-theme libcanberra-gtk-module libcanberra-gtk3-module 
RUN cp -r /usr/share/icons/breeze /usr/share/icons/EducaAndOSIcons

# Instalar bell-scheduler
RUN sudo apt-get install -y lliurex-artwork-icons lliurex-artwork-icons-neu python3-netifaces python3-gi python3-gi-cairo gir1.2-appindicator3-0.1 gir1.2-gtk-3.0 gir1.2-notify  python-psutil taskscheduler bell-scheduler

RUN apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module 

# Ejecución app

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/bin/bash", "-c", "/docker-entrypoint.sh" ]






