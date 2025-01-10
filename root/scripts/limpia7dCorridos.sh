#!/bin/sh
#set -x
# Este script lista los usuarios de la tabla usadas de hace cierto tiempo ,que pertenezcan a x grupos, despues los elimina
# Syed Jahanzaib / June 2019
SQLPASS="Passw@rd"
Days="31"
export MYSQL_PWD=$SQLPASS
> /tmp/expired.mensual.txt

#mysql -uroot -e “use radius; select username from rm_users where expiration BETWEEN ‘2010-01-01’ AND ‘2019-04-30’;” |sort > /tmp/expired.mensual.txt

# Lista los usuarios de la tabla usadas que hayan iniciado sesion por primera vez hace x tiempo y que pertenezcan a los grupos x 
mysql -uroot -e "use radius; SELECT username FROM usadas WHERE min <= DATE_SUB(CURDATE(), INTERVAL $Days day) and (groupname = '30dCorridos' OR groupname = '7dCorridos')" |sort > /tmp/expired.mensual.txt
#Extrae esa lista y despues elimina cada uno de los usuarios.
num=0
cat /tmp/expired.mensual.txt | while read users
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
cp /tmp/expired.mensual.txt /root/scripts/expmensual.txt
# Parte 2 para limpiar la base de datos en radpostauth && raddact
#mysql -uroot -e "use radius; DELETE FROM radpostauth WHERE authdate <= DATE_SUB(CURDATE(), INTERVAL $Days day);"
#mysql -uroot -e "use radius; DELETE FROM radacct WHERE acctstarttime <= DATE_SUB(CURDATE(), INTERVAL $Days day);"
#mysql -uroot -e "use radius; DELETE FROM userbillinfo WHERE creationdate <= DATE_SUB(CURDATE(), INTERVAL $Days day);"
#mysql -uroot -e "use radius; DELETE FROM radpostauth WHERE authdate <= DATE_SUB(CURDATE(), INTERVAL $Days day);"
echo "Base de datos limpiada correctamente"

