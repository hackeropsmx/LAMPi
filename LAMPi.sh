#!/bin/bash
#######################################
# script para la instalacion de AMP y PHPMyAdmin con algunos tweaks.
#diseñado para sistemas basados en Debian.
# elaborado por @Hacker Ops http://hackerops.com
# #######################################


printf "\e[1;97m \e[0m\n"
printf "\e[1;97m                                                     *.::*            \e[0m\n"
printf "\e[1;97m                                              *-/+sydmmmmh*           \e[0m\n"
printf "\e[1;97m                                         */shmNNNNNNNMMNNNd:          \e[0m\n"
printf "\e[1;97m                                         -NMMMMMMMMMMMMMMNNNdys+-     \e[0m\n"
printf "\e[1;97m                                          dMMMMMMMMMMMMMMMNNNNNNNd+*  \e[0m\n"
printf "\e[1;97m                                       */omNMMMMMMMMMMMMMMNNh:dMMMNd* \e[0m\n"
printf "\e[1;97m                                      +mNNNNNMMMMMMMMMMNmdo.**hMMMMM+ \e[0m\n"
printf "\e[1;97m                                      mNNMM\e[0m\\e[0;30m+/osyyyhdddhysso+sm\e[0m\e[1;97mMMMMMN-\e[0m\e[1;77m\e[0m\n"
printf "\e[1;97m                                      :mNMMmo:..*.+hhhddmNNMMMMMMMd:  \e[0m\n"
printf "\e[1;97m/ddddds                 ****         *+hmNMNNmmmNNMMMMMMMMMMMmy:*   \e[0m\n"
printf "\e[1;97m+MMMMMh            *:oydmmmmdy- *ddddhhyyyhhdmmNNNNNNNNNmds+-*      \e[0m\n"
printf "\e[1;97m+MMMMMh           /dNMMMMMMMMM: *MMMMMMMNNmdhhhyy...syyyho          \e[0m\n"
printf "\e[1;97m+MMMMMh          oMMMMMmhyyhdd  *mmmmmMMMMMNddddh   mNNNMh          \e[0m\n"
printf "\e[1;97m+MMMMMh         .MMMMMy.    *.   *****NMMMMh*****   NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMh         :MMMMM+               NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMh         *NMMMMNs-*            NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMh          :mMMMMMNdo-*         NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMh           .sNMMMMMMNh:        NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMh             .+hNMMMMMMo       NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMh                .oNMMMMM:      NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMh                  -MMMMMy      NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMh                  .MMMMMs      NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMmooooooo:  hs+/::/sNMMMMN.      NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMMMMMMMMMy :MMMMMMMMMMMMd.       NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMMMMMMMMMy +NMMMMMMMMms:         NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m.............   *--::-.*            .....*        .....*          \e[0m\n"
printf "\e[1;77m.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::.\e[0m\n"
printf "\e[1;77m.:::::\e[1;4;97mLicenciatura en Seguridad en Tecnologias de la informacion\e[0m\e[1;77m:::::.\e[0m\n"
printf "\e[1;77m.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::.\e[0m\n"

#COLORES
# Reseteo de colores
resetear_color='\033[0m'

# Regular Colors
Rojo='\033[0;31m'
Verde='\033[0;32m'
Amarillo='\033[0;33m'
Purpura='\033[0;35m'
Cian='\033[0;36m'


# actualizar paquetes y actaulizar sistema
echo -e "$Cian \n Actualizando Sistema.... $resetear_color"
sudo sed -i 's/deb cdrom/#deb cdrom/' /etc/apt/sources.list
sudo apt-get update -y && sudo apt-get upgrade -y

## Instalar AMP
echo -e "$Cian \n Installando Apache2 $resetear_color"
sudo apt-get install apache2 apache2-utils libexpat1 ssl-cert -y

echo -e "$Cian \n Installando Mariadb (requiere interaccion) $resetear_color"
sudo apt install mariadb-server mariadb-client
sudo mysql_secure_installation

echo -e "$Cian \n Installando PHP & Requirements $resetear_color"
sudo apt-get install php php-common libapache2-mod-php php-curl php-dev php-gd php-gettext php-imagick php-intl php-mbstring php-mysql php-pear php-pspell php-recode php-xml php-zip -y

echo -e "$Cian \n Installando phpMyAdmin (requiere interaccion) $resetear_color"
sudo apt-get install phpmyadmin -y

echo -e "$Cian \n Verificando instalacion $resetear_color"
sudo apt-get install apache2 apache2-utils libexpat1 ssl-cert libapache2-mod-php php php-common php-curl php-dev php-gd php-pear php-imagick  php-mysql php-ps php7.4-xsl -y

## TWEAKS
# Permisos
echo -e "$Cian \n Permisos para /var/www $resetear_color"
sudo chown -R www-data:www-data /var/www
echo -e "$Verde \n Los permisos se han establecido $resetear_color"

#Habilitar Mod Rewrite, requerido para enlaces permanentes de WordPress y archivos .htaccess
echo -e "$Cian \n habilitando Modulos $resetear_color"
sudo a2enmod rewrite
#sudo php5enmod mcrypt

#Reiniciar Apache
echo -e "$Cian \n Reiniciando Apache $resetear_color"
sudo service apache2 restart

echo -e "$Cian \n Hackerops $resetear_color"
# LEYENDA LSTI
printf "\e[1;97m \e[0m\n"
printf "\e[1;97m                                                     *.::*            \e[0m\n"
printf "\e[1;97m                                              *-/+sydmmmmh*           \e[0m\n"
printf "\e[1;97m                                         */shmNNNNNNNMMNNNd:          \e[0m\n"
printf "\e[1;97m                                         -NMMMMMMMMMMMMMMNNNdys+-     \e[0m\n"
printf "\e[1;97m                                          dMMMMMMMMMMMMMMMNNNNNNNd+*  \e[0m\n"
printf "\e[1;97m                                       */omNMMMMMMMMMMMMMMNNh:dMMMNd* \e[0m\n"
printf "\e[1;97m                                      +mNNNNNMMMMMMMMMMNmdo.**hMMMMM+ \e[0m\n"
printf "\e[1;97m                                      mNNMM\e[0m\\e[0;30m+/osyyyhdddhysso+sm\e[0m\e[1;97mMMMMMN-\e[0m\e[1;77m\e[0m\n"
printf "\e[1;97m                                      :mNMMmo:..*.+hhhddmNNMMMMMMMd:  \e[0m\n"
printf "\e[1;97m/ddddds                 ****         *+hmNMNNmmmNNMMMMMMMMMMMmy:*   \e[0m\n"
printf "\e[1;97m+MMMMMh            *:oydmmmmdy- *ddddhhyyyhhdmmNNNNNNNNNmds+-*      \e[0m\n"
printf "\e[1;97m+MMMMMh           /dNMMMMMMMMM: *MMMMMMMNNmdhhhyy...syyyho          \e[0m\n"
printf "\e[1;97m+MMMMMh          oMMMMMmhyyhdd  *mmmmmMMMMMNddddh   mNNNMh          \e[0m\n"
printf "\e[1;97m+MMMMMh         .MMMMMy.    *.   *****NMMMMh*****   NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMh         :MMMMM+               NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMh         *NMMMMNs-*            NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMh          :mMMMMMNdo-*         NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMh           .sNMMMMMMNh:        NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMh             .+hNMMMMMMo       NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMh                .oNMMMMM:      NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMh                  -MMMMMy      NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMh                  .MMMMMs      NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMmooooooo:  hs+/::/sNMMMMN.      NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMMMMMMMMMy :MMMMMMMMMMMMd.       NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m+MMMMMMMMMMMMMy +NMMMMMMMMms:         NMMMMh        NMMMMh          \e[0m\n"
printf "\e[1;97m.............   *--::-.*            .....*        .....*          \e[0m\n"
printf "\e[1;77m.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::.\e[0m\n"
printf "\e[1;77m.:::::\e[1;4;97mLicenciatura en Seguridad en Tecnologias de la informacion\e[0m\e[1;77m:::::.\e[0m\n"
printf "\e[1;77m.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::.\e[0m\n"
