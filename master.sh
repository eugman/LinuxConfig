#! /bin/bash

if [[ $UID -ne 0 ]]
then
	echo Non root user!
	exit 1
fi

cpu=$( uname -m )

apt-get -y update
apt-get -y upgrade

apt-get -y install git vim tmux wget htop ssh gtypist bombardier
apt-get -y install python3-pip

apt-get -y install xrdp realvnc-vnc-server realvnc-vnc-client


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

  apt-get -y install avahi-daemon
  raspi-config

fi

apt-get clean
