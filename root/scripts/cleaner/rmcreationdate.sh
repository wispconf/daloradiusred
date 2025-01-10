#!/bin/sh
#set -x
# Este script elimina fichas creadas en x fecha, y tambien limpia las bases de datos de hace 30 dias.
# Cambiar el password de tu DB
SQLPASS="Passw@rd"
export MYSQL_PWD=$SQLPASS
> /tmp/expired.users.txt

# extrae y despues elimina las fichas de hace 10 dias de haberlas introducido a un dispocitivo
#Seleccionar usuarios de la tabla userinfo que hayan sido creados la fecha x
mysql -uroot -e "use radius; SELECT username FROM userinfo WHERE creationdate like '2023-05-25 07:1%'" |sort > /tmp/expired.users.txt
num=0
cat /tmp/expired.users.txt | while read users
do
num=$[$num+1]
USERNAME=`echo $users | awk '{print $1}'`
echo "$USERNAME"
#Eliminar esos usuarios listados en las tablas x
mysql -uroot -e "use radius; DELETE FROM userinfo WHERE username = '$USERNAME';"
mysql -uroot -e "use radius; DELETE FROM radcheck WHERE username = '$USERNAME';"
mysql -uroot -e "use radius; DELETE FROM radacct WHERE username = '$USERNAME';"
mysql -uroot -e "use radius; DELETE FROM radusergroup WHERE username = '$USERNAME';"
mysql -uroot -e "use radius; DELETE FROM userbillinfo WHERE username = '$USERNAME';"

done
#Copia usuarios a root
cp /tmp/expired.users.txt /root/scripts/exp.txt
# Parte 2 para limpiar la base de datos en radpostauth && raddact que son los accounting y conexiones
mysql -uroot -e "use radius; DELETE FROM radpostauth WHERE authdate <= DATE_SUB(CURDATE(), INTERVAL 30 day);"
mysql -uroot -e "use radius; DELETE FROM radacct WHERE acctstarttime <= DATE_SUB(CURDATE(), INTERVAL 30 day);"
mysql -uroot -e "use radius; DELETE FROM userbillinfo WHERE creationdate <= DATE_SUB(CURDATE(), INTERVAL 30 day);"
mysql -uroot -e "use radius; DELETE FROM radpostauth WHERE authdate <= DATE_SUB(CURDATE(), INTERVAL 30 day);"
echo "Base de datos limpiada correctamente"
