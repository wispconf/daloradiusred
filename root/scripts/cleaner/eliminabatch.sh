#!/bin/sh
#set -x
# Este script elimina fichas de un lote completo y despues borra los logs del accounting y conexiones
# Cambiar el password de tu DB
SQLPASS="Passw@rd"
export MYSQL_PWD=$SQLPASS
> /tmp/expired.users.txt

# extrae y lista las fichas de la tabla fichas con el lote xxxxxx
mysql -uroot -e "use radius; SELECT username FROM printme WHERE batch_name = '290823J'" |sort > /tmp/expired.users.txt
# Ahora elimina las fichas de ese lote de la base de datos
num=0
cat /tmp/expired.users.txt | while read users
do
num=$[$num+1]
USERNAME=`echo $users | awk '{print $1}'`
echo "$USERNAME"
mysql -uroot -e "use radius; DELETE FROM userinfo WHERE username = '$USERNAME';"
mysql -uroot -e "use radius; DELETE FROM radcheck WHERE username = '$USERNAME';"
mysql -uroot -e "use radius; DELETE FROM radacct WHERE username = '$USERNAME';"
mysql -uroot -e "use radius; DELETE FROM radusergroup WHERE username = '$USERNAME';"
mysql -uroot -e "use radius; DELETE FROM userbillinfo WHERE username = '$USERNAME';"

done
#Copia usuarios a root
cp /tmp/expired.users.txt /root/scripts/exp.txt
# Parte 2 para limpiar la base de datos en radpostauth && raddact a x tiempo
mysql -uroot -e "use radius; DELETE FROM radpostauth WHERE authdate <= DATE_SUB(CURDATE(), INTERVAL 60 day);"
mysql -uroot -e "use radius; DELETE FROM radacct WHERE acctstarttime <= DATE_SUB(CURDATE(), INTERVAL 60 day);"
mysql -uroot -e "use radius; DELETE FROM userbillinfo WHERE creationdate <= DATE_SUB(CURDATE(), INTERVAL 60 day);"
mysql -uroot -e "use radius; DELETE FROM radpostauth WHERE authdate <= DATE_SUB(CURDATE(), INTERVAL 60 day);"
echo "Base de datos limpiada correctamente"
