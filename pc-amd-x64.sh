#/bin/bash

cd /tmp/
sudo apt install apt-transport-https curl

#Instalar Google Chrome desde repositorios oficiales
sudo echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list
sudo wget https://dl.google.com/linux/linux_signing_key.pub
sudo apt-key add linux_signing_key.pub

#Instalacion de diversos software
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5 && echo 'deb https://download.onlyoffice.com/repo/debian squeeze main' | sudo tee -a /etc/apt/sources.list.d/onlyoffice.list
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg && echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt-get update
sudo apt install -y cpu-x google-chrome-stable onlyoffice-desktopeditors brave-browser tor handbrake kdenlive git gimp
mkdir -p ~/.config/GIMP/2.10/

bash -c "$(curl -fsSL https://raw.githubusercontent.com/josetg01/oh-my-bash/master/tools/install.sh)"
