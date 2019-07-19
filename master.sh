#! /bin/bash

if [[ $UID -ne 0 ]]
then
	echo Non root user!
	exit 1
fi

cpu=$( uname -m )

apt-get update
apt-get upgrade

apt-get -y install git vim tmux wget htop ssh gtypist bombardier
apt-get -y install games-rogue
#allure angband angband-data crawl crawl-commom gearhead gearhead-data hearse 
#hyperrogue lambdahack meritous moria nethack omega-rpg slashem tasksel tasksel-data
apt-get -y install python3-pip

apt-get -y install xrdp tightvncserver

#apt-get install wicd-curses


if [[ $cpu == 'x86_64' ]]
then
  apt-get -y install steam

  snap install slack --classic
  snap install discord

  wget -nc https://azuredatastudiobuilds.blob.core.windows.net/releases/1.9.0/azuredatastudio-linux-1.9.0.deb
  dpkg -i ./azuredatastudio-linux-1.9.0.deb

fi

if [[ $cpu == 'armv7l' ]] || [[ $cpu == 'armv6l' ]]
then

  apt-get install avahi-daemon
  raspi-config

fi

