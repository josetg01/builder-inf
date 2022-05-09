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
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5 && echo 'deb https://download.onlyoffice.com/repo/debian squeeze main' | sudo tee -a /etc/apt/sources.list.d/onlyoffice.list
sudo add-apt-repository ppa:obsproject/obs-studio
sudo add-apt-repository ppa:kdenlive/kdenlive-stable
sudo apt-get update
sudo apt install cpu-x ffmpeg obs-studio onlyoffice-desktopeditors
sudo flatpak install flathub fr.handbrake.ghb -y
