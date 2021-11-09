SERVICES="/bin/dbus-uuidgen --ensure;/bin/dbus-daemon --system --fork;/usr/bin/pulseaudio --system --daemonize --high-priority --log-target=syslog --disallow-exit --disallow-module-loading=1"

rm -f /var/run/dbus/pid > /dev/null 2>&1
sleep 1

IFS=';'
for s in $SERVICES; do
    echo $s
    screen -d -m bash -x -c $s
done

#export LANG=es_ES.UTF-8 

service cron start 

systemctl start cron

screen -d -m bash -c /usr/sbin/n4d-server

screen -d -m /usr/bin/bell-scheduler-indicator

/usr/sbin/bell-scheduler
