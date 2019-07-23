#! /bin/bash

if [[ $UID -ne 0 ]]
then
	echo Non root user!
	exit 1
fi

cpu=$( uname -m )

apt-get -y update
apt-get -y upgrade

apt-get -y install git vim tmux wget htop ssh telnet
apt-get -y install bombardier gtypist nsnake moon-buggy greed
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
  
  #change the locale
  sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/default/keyboard
  locale-gen en_US.UTF-8
  update-locale en_US.UTF-8
  #change the keyboard layout
  sed -i 's/XKBLAYOUT="gb"/XKBLAYOUT="us"/' /etc/default/keyboard
  timedatectl set-timezone America/New_York
  
  #install wifi controls for raspberry pi 1
  if [[ $cpu == 'armv6l' ]]
  then
    cp wpa_supplicant.conf /etc/wpa_supplicant.conf/wpa_supplicant.conf
  fi
  

fi

apt-get clean
