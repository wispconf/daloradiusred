#!/bin/sh
#set -x
#Eliminar fichas creadas de hace mas de x tiempo
# Extraer un listado de determinados usuarios#############################
# Cambiar el password de tu DB
SQLPASS="Passw@rd"
export MYSQL_PWD=$SQLPASS
> /tmp/expired.users.txt
# extrae listado de usuarios del grupo en el sistema.
#mysql -uroot -e "use radius; SELECT username FROM radusergroup WHERE groupname = '12hPausada'" |sort > /tmp/expired.users.txt
mysql -uroot -e "use radius; SELECT username FROM userinfo WHERE creationdate <= DATE_SUB(CURDATE(), INTERVAL 515 day)" |sort > /tmp/expired.users.txt
#mysql -uroot -e "use radius; SELECT username FROM userinfo WHERE creationdate like '2024-09%'" |sort > /tmp/expired.users.txt


#eliminar usuarios#############################
num=0
cat /tmp/expired.users.txt | while read users
do
num=$[$num+1]
USERNAME=`echo $users | awk '{print $1}'`
echo "$USERNAME"

#mysql -uroot -e "use radius; UPDATE radusergroup SET groupname = '2HrPausada' WHERE username = '$USERNAME';"
mysql -uroot -e "use radius; DELETE FROM userinfo WHERE username = '$USERNAME';"
mysql -uroot -e "use radius; DELETE FROM radcheck WHERE username = '$USERNAME';"
mysql -uroot -e "use radius; DELETE FROM radacct WHERE username = '$USERNAME';"
mysql -uroot -e "use radius; DELETE FROM radusergroup WHERE username = '$USERNAME';"
mysql -uroot -e "use radius; DELETE FROM userbillinfo WHERE username = '$USERNAME';"

done
