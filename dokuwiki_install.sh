#!/bin/bash


echo -n "Enter NAME (default = dokuwiki):"
read NAME
NAME=${NAME:-dokuwiki}
echo  "$NAME"


echo -n "Enter PORT number (default = 80):"
read PORT
PORT=${PORT:-80}
echo  "$PORT"


sudo docker run -d \
  --name=$NAME \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -p $PORT:80 \
  -v "$(pwd)/.config-dokuwiki/":/config \
  --restart unless-stopped \
  lscr.io/linuxserver/dokuwiki:latest

