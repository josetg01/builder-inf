#/bin/bash

cd /tmp/
wget 

#Instalar Google Chrome desde repositorios oficiales
sudo echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list
sudo wget https://dl.google.com/linux/linux_signing_key.pub
sudo apt-key add linux_signing_key.pub
sudo apt update && sudo apt install -y google-chrome-stable

#Instalar PhotoGIMP
sudo flatpak install flathub org.gimp.GIMP -y

#Instalacion de diversos software
sudo add-apt-repository ppa:obsproject/obs-studio
sudo add-apt-repository ppa:kdenlive/kdenlive-stable
sudo apt-get update
sudo apt install cpu-x ffmpeg obs-studio
sudo flatpak install flathub fr.handbrake.ghb -y
