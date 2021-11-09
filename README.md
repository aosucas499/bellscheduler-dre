# Bell Scheduler - dre


Aún en pruebas - TESTING

Aplicación dockerizada Bell-Scheduler proveniente del sistema [Lliurex](https://portal.edu.gva.es/lliurex/va/descarregues/).

+ Ubuntu Focal and Bionic
+ Linux Mint based on Ubuntu Focal and Bionic 

![](http://wiki.lliurex.net/tiki-download_file.php?fileId=2481&display)

## FUNCIONA

+ Sonido a las horas y días de la semana programados, usando archivos de sonido.

## NO FUNCIONA

+ Importar y Exportar alarmas - El método elegido en esta versión está explicado en la [WIKI.](https://github.com/aosucas499/bellscheduler-dre/wiki)
+ Holidays control (es mejor no incorporar esta función, basta con tener el dispositivo silenciado o apaguado el día que es festivo).
+ Mostrar información de que la alarma está sonando. (Por ahora solo funciona ejecutar en terminal "pkill ffplay")
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

