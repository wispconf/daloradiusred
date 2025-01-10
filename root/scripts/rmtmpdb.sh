#!/bin/sh
#set -x
# Este script elimina las conexiones creadas en http://IP/daloradius/rep-lastconnect.php de hace cierto tiempo
# tambien elimina las entradas en http://IP/daloradius/acct-all.php importante ya que de aqui se toman las sumas de tiempo de los usuarios
SQLPASS="Passw@rd"
export MYSQL_PWD=$SQLPASS
mysql -uroot -e "use radius; DELETE FROM radpostauth WHERE authdate <= DATE_SUB(CURDATE(), INTERVAL 60 day);"
mysql -uroot -e "use radius; DELETE FROM radacct WHERE acctstarttime <= DATE_SUB(CURDATE(), INTERVAL 90 day);"
echo "Base de datos limpiada correctamente"
