#!/bin/sh
#set -x
# Este script crea un listado, dependiendo de que tabla y especificacion se le de
# Cambiar el password de tu DB
SQLPASS="Passw@rd"
export MYSQL_PWD=$SQLPASS
> /tmp/expired.users.txt
> /root/scripts/listar/lista.txt
# lista usuarios de la tabla radusergroup que tenga como grupo xxxxxxxxx
mysql -uroot -e "use radius; SELECT username FROM radusergroup WHERE groupname = '30dCorridos'" |sort > /tmp/expired.users.txt
# # lista usuarios de la tabla fichas que tenga como nombre de lote xxxxxxxxx
#mysql -uroot -e "use radius; SELECT username FROM fichas WHERE batch_name = '2401237dOF'" |sort > /tmp/expired.users.txt
# # lista usuarios de la tabla userinfo donde el primer nombre sea xxxxxxx
#mysql -uroot -e "use radius; SELECT username FROM userinfo WHERE userinfo.firstname like '2401212B%'" |sort > /tmp/expired.users.txt
#Copia usuarios a /root/scripts/listar/lista.txt
cp /tmp/expired.users.txt /root/scripts/listar/lista.txt
echo "Base de datos limpiada correctamente"
cat /root/scripts/listar/lista.txt
