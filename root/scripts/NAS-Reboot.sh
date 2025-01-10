#!/bin/sh
#set -x
# Elimina los errores que causan por desconexion o perdida en mikrotik, a daloradius en accounting llamados NAS-Reboot
# Este script en el crontab -e se agrega:
# */5  * * * * sudo bash /root/scripts/NAS-Reboot.sh
SQLPASS="Passw@rd"
export MYSQL_PWD=$SQLPASS

mysql -uroot -e "use radius; DELETE FROM radacct WHERE acctterminatecause ='NAS-Reboot';" 

echo "Limpiado los NAS-Reboot"
