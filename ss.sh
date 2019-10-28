#!/bin/bash
clear
echo "[+] Take screenshot"
echo "[?] $0 <dockerip> <port> <imagesize> <session>"
echo "[?] Ex: $0 127.0.0.1 4444 800x600 350bef040a64742024ef39146f3a43ad"
viewer=/usr/bin/display-im6.q16

if [ -z "$1" ] 
then
 echo "[X] Define a host"
else
 host=$1
fi

if [ -z "$2" ]
then
 echo "[X] Define a port"
 exit
else
 port=$2
fi

if [ -z "$3" ]
then
 echo "[X] Define a sie"
 exit
else
 size=$3
fi

if [ -z "$4" ]
then
 echo "[X] Define a session"
 exit
else
 session=$4
fi



echo "[!] Screenshot for:"
echo "Port - $port"
echo "session - $session"

#command
curl http://$host:$port/wd/hub/session/$session/screenshot | cut -d'"' -f4 | base64 -d > picture.jpeg && $viewer -resize $size -nostdin picture.jpeg

echo "[+] Loading screeshot..."
echo "[+] Check $PWD/picture.jpeg"
