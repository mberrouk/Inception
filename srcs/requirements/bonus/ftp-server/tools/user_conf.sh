#!/bin/bash

set -ue

useradd $FTP_USER

echo "$FTP_USER:$FTP_PASS" | chpasswd

mkdir -p /home/$FTP_USER/ftp
chown $FTP_USER /home/$FTP_USER/ftp
usermod -a -G root $FTP_USER 
usermod -g 0 -ou 0 $FTP_USER 

