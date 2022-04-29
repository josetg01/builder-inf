#!/bin/bash

apk add sudo docker docker-compose transmission-daemon samba

# Docker configuration
mkdir -p /docker/{config,data,cache,etc}
sudo rc-update add docker
sudo rc-service docker start
sleep 30
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:2.9.3

# Users
adduser -s /bin/zsh -u 5000 josemaria
adduser -s /bin/sbin/nologin -u 5001 pablo -D
adduser -s /bin/sbin/nologin -u 5002 domingo -D
adduser -s /bin/sbin/nologin -u 5001 mercedes -D
echo "familia:x:4000:josemaria,pablo,domingo,mercedes" >> /etc/group
