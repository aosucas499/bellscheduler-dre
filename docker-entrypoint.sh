#!/bin/bash

SERVICES="/bin/dbus-uuidgen --ensure;/bin/dbus-daemon --system --fork;/usr/bin/pulseaudio --system --daemonize --high-priority --log-target=syslog --disallow-exit --disallow-module-loading=1"

rm -f /var/run/dbus/pid > /dev/null 2>&1
sleep 1

IFS=';'
for s in $SERVICES; do
    echo $s
    screen -d -m bash -x -c $s
done

#addgroup --quiet --gid ${GID} ${GROUP} || true
#adduser  --quiet --home /home/${USER} --shell /bin/false --gecos "UserAccount" --uid ${UID} --ingroup ${GROUP} --disabled-password --disabled-login ${USER} || true

#export LANG=es_ES.UTF-8

screen -d -m bash -c /usr/sbin/n4d-server 

#mkdir -p /home/admin
#usermod -a -G sudo admin
#usermod -a -G admins admin
#sudo usermod -a -G teachers admin

/usr/sbin/bell-scheduler

#chown -R $USER:$GROUP /home/${USER} || true


