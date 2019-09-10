#!/bin/sh

#######################################
# script para la instalacion de AMP y PHPMyAdmin con algunos tweaks.
#diseñado para sistemas basados en Debian.
# elaborado por @Hacker Ops http://hackerops.com
# #######################################

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
sudo apt-get update -y && sudo apt-get upgrade -y

## Instalar AMP
echo -e "$Cian \n Installando Apache2 $resetear_color"
sudo apt-get install apache2 apache2-utils libexpat1 ssl-cert -y

echo -e "$Cian \n Installando Mariadb $resetear_color"
sudo apt install mariadb-server mariadb-client
sudo mysql_secure_installation

echo -e "$Cian \n Installando PHP & Requirements $resetear_color"
sudo apt install php7.2 libapache2-mod-php7.2 php7.2-mysql php-common php7.2-cli php7.2-common php7.2-json php7.2-opcache php7.2-readline -y

echo -e "$Cian \n Installando phpMyAdmin $resetear_color"
sudo apt-get install phpmyadmin -y

echo -e "$Cian \n Verificando instalacion $resetear_color"
sudo apt-get install apache2 -y

## TWEAKS
# Permisos
echo -e "$Cian \n Permisos para /var/www $resetear_color"
sudo chown -R www-data:www-data /var/www
echo -e "$Verde \n Los permisos se han establecido $resetear_color"

#Habilitar Mod Rewrite, requerido para enlaces permanentes de WordPress y archivos .htaccess
#echo -e "$Cian \n habilitando Modulos $resetear_color"
#sudo a2enmod rewrite
#sudo php5enmod mcrypt

# Reiniciar Apache
echo -e "$Cian \n Restarting Apache $resetear_color"
sudo service apache2 restart
