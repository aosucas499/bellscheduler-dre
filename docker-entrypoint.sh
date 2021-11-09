SERVICES="/bin/dbus-uuidgen --ensure;/bin/dbus-daemon --system --fork"

rm -f /var/run/dbus/pid > /dev/null 2>&1
sleep 1

IFS=';'
for s in $SERVICES; do
    echo $s
    screen -d -m bash -x -c $s
done

#export LANG=es_ES.UTF-8 

#Actualizar youtube-dl en cada arranque
#wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/bin/youtube-dl
#chmod a+rx /usr/bin/youtube-dl

if [ -d "/backup" ]; then
    echo "Carpeta backup existe"
    cp -r -u /backup/* /usr/local/share/bellScheduler/sounds/
    cp -r -u /usr/local/share/bellScheduler/sounds/* /backup/
     
else
    echo "Creando carpeta backup"
    mkdir /backup
    cp -r -u /usr/local/share/bellScheduler/* /backup 
  
fi
screen -d -m bash -c /usr/sbin/n4d-server

screen -d -m /usr/bin/bell-scheduler-indicator

/usr/sbin/bell-scheduler

chown -R $HOST_USER:$HOST_USER /root 
chown -R $HOST_USER:$HOST_USER /backup 
chown -R $HOST_USER:$HOST_USER /usr/local/share/bellScheduler 
chown -R $HOST_USER:$HOST_USER /etc/bellScheduler/ || TRUE


