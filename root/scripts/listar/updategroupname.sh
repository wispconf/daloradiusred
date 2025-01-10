#!/bin/sh
#set -x
# Este script lista los usuarios a un archivo y despues realiza la accion solicitada por ejemplo, cambiarles el grupo o perfil
# Extraer un listado de determinados usuarios#############################
SQLPASS="Passw@rd"
export MYSQL_PWD=$SQLPASS
> /tmp/expired.users.txt
> /root/scripts/listar/lista.txt
# Extrae listado de usuarios en el batch o lote.
mysql -uroot -e "use radius; SELECT username FROM fichas WHERE batch_name = '27122412H'" |sort > /tmp/expired.users.txt
# extrae listado de usuarios del grupo en el sistema.
#mysql -uroot -e "use radius; SELECT username FROM radusergroup WHERE groupname = '12hPausada'" |sort > /tmp/expired.users.txt
# Extrae usuarios con userinfo.firstname
#mysql -uroot -e "use radius; SELECT username FROM userinfo WHERE userinfo.firstname like '2401212B%'" |sort > /tmp/expired.users.txt
#Copia usuarios a /root/scripts/listar/lista.txt
cp /tmp/expired.users.txt /root/scripts/listar/lista.txt
#Cambiar el nombre de grupo a una lista de usuarios creada anteriormente#############################
num=0
cat /root/scripts/listar/lista.txt | while read users
do
num=$[$num+1]
USERNAME=`echo $users | awk '{print $1}'`
echo "$USERNAME"
mysql -uroot -e "use radius; UPDATE radusergroup SET groupname = '2HrPausada' WHERE username = '$USERNAME';"
done
