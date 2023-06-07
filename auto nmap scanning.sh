#auto nmap scanning

#!/bin/sh

XXX="192.168.50"
NMAP_DIR="/var/log/nmap"

mkdir /var/log/nmap/$XXX

if [ -d $NMAP_DIR ] ; then
    echo "directory exists"
else
    echo "creating directory"
    #mkdir /var/log/nmap/$XXX
fi



TODAY=`date +"%d-%m-%y"`

if [ -f /var/log/nmap/$XXX/scan-$TODAY.xml ] ; then
    echo "file exists"
else
    echo "creating file"
    touch /var/log/nmap/$XXX/scan-$TODAY.xml
fi

OPTIONS="--open --reason -oX /var/log/nmap/$XXX/scan-$TODAY.xml -F 192.168.50.0/24"

nmap $OPTIONS

sleep 10
rm /var/log/nmap/$XXX/yesterday.xml
mv /var/log/nmap/$XXX/today.xml /var/log/nmap/$XXX/yesterday.xml

ln -s /var/log/nmap/$XXX/scan-$TODAY.xml /var/log/nmap/$XXX/today.xml