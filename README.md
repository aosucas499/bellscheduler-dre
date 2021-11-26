# Bell Scheduler - dre

Aplicación [dockerizada](https://www.docker.com/) Bell-Scheduler. 

**Bell Scheduler** es una aplicación destinada a programar alarmas reproduciendo el sonido que se haya asociado en cada alarma, a los días de la semana y horas programadas.
Esta aplicación proviene del sistema [Lliurex](https://portal.edu.gva.es/lliurex/va/descarregues/).

![](https://github.com/aosucas499/bellscheduler-dre/raw/testing/icons/bellscheduler-place.png)

![](https://github.com/aosucas499/bellscheduler-dre/raw/testing/bellscheduler-dre-appindicator/screenshot.png)

## FUNCIONA
+ Sistema EducaAndOS, basado en Ubuntu Focal 20.04.
+ Sonido a las horas y días de la semana programados, usando archivos de sonido.
+ Usa archivos de audio alojados en tu sistema, explicado en la [WIKI.](https://github.com/aosucas499/bellscheduler-dre/wiki/Usar-archivos-de-audio-con-el-programa)
+ Importar y Exportar alarmas
+ Parar alarma al sonar.

![](http://wiki.lliurex.net/tiki-download_file.php?fileId=2481&display)

## NO FUNCIONA
+ Repoducción de canciones aleatorias de un directorio.
+ Holidays control (es mejor no incorporar esta función, basta con tener el dispositivo silenciado o apagado el día que es festivo).
 (Por ahora solo funciona ejecutar en terminal "pkill ffplay")
+ Usar sonido desde YOUTUBE (esta función no está incorporada, no funcionaba bien en la versión original y se corre el riesgo de que no descargue el sonido para la hora programada).

## INSTALL

    sudo apt-get update -y
    
    sudo apt-get install git -y

    git clone https://github.com/aosucas499/bellscheduler-dre.git

    cd bellscheduler-dre
    
    chmod +x install-bellscheduler-dre

    ./install-bellscheduler-dre
    
    sudo reboot (Reboot the system - Reiniciar el sistema)

Manual de Instrucciones de la app original (puede que alguna función no funcione): [Aquí](https://github.com/aosucas499/bellscheduler-dre/raw/docker-xenial/manual%20de%20Bell%20Scheduler-alarmas%20del%20cole.pdf)

<b>Thanks to</b> [Lliurex Team](https://portal.edu.gva.es/lliurex/va/) 

<b>Gracias</b> al equipo de Lliurex Team, basé mi dockerfile en su [app](http://wiki.lliurex.net/tiki-index.php?page=Bell+Scheduler).

