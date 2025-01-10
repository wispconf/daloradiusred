#!/bin/sh
#set -x
# Lista los usuarios de la tabla usadas que hayan iniciado sesion hace cierto tiempo y pertenezcan a los grupos x, util para colocar vigencia a fichas
# Syed Jahanzaib / June 2019
SQLPASS="Passw@rd"
Days="11"
export MYSQL_PWD=$SQLPASS
> /tmp/expired.users.txt

# Fetch users who have expired 2 months ago & before, (using expired date), BE CAREFUL WHEN USING THIS
mysql -uroot -e "use radius; SELECT username FROM usadas WHERE min <= DATE_SUB(CURDATE(), INTERVAL $Days day) and (groupname = '2hPausada' OR groupname = '3HrPausada' OR groupname = '12hPausada' OR groupname = '2HrPausada' OR groupname = '12HrPausada')" |sort > /tmp/expired.users.txt
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
