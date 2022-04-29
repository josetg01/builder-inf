#!/bin/bash

apk add sudo docker docker-compose transmission-daemon samba zsh

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
sudo wget https://raw.githubusercontent.com/josetg01/builder-inf/main/raspi.yml -O /docker/docker-compose.yml
cd /docker && sudo docker-compose up -d

# Users
adduser -s /bin/zsh -u 5000 josemaria
sudo echo -ne "josemaria\njosemaria\n" | sudo passwd josemaria
sudo echo -ne "josemaria\njosemaria\n" | sudo smbpasswd -a josemaria
echo "josemaria ALL=(ALL) ALL" >> /etc/sudoers
adduser -s /bin/sbin/nologin -u 5001 pablo -D
sudo echo -ne "pablo/npablo/n" | sudo smbpasswd -a pablo
adduser -s /bin/sbin/nologin -u 5002 domingo -D
sudo echo -ne "domingo/ndomingo/n" | sudo smbpasswd -a domingo
adduser -s /bin/sbin/nologin -u 5003 mercedes -D
sudo echo -ne "mercedes/nmercedes/n" | sudo smbpasswd -a mercedes
echo "familia:x:4000:josemaria,pablo,domingo,mercedes" >> /etc/group
