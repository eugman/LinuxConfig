#! /bin/bash

if [[ $UID -ne 0 ]]
then
	echo Non root user!
	exit 1
fi

cpu=$( uname -m )

apt-get update
apt-get upgrade

apt-get -y install git vim tmux wget htop gtypist bombardier
apt-get -y install python3-pip

#apt-get install wicd-curses


if [[ $cpu == 'x86_64' ]]
then
  apt-get -y install steam xrdp

  snap install slack --classic
  snap install discord

  wget -nc https://azuredatastudiobuilds.blob.core.windows.net/releases/1.9.0/azuredatastudio-linux-1.9.0.deb
  dpkg -i ./azuredatastudio-linux-1.9.0.deb

fi

