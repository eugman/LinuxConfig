#! /bin/bash

if [[ $UID -ne 0 ]]
then
	echo Non root user!
	exit 1
fi

cpu=$( uname -m )
desktop=$( dpkg -l ubuntu-desktop )

apt-get -y update
apt-get -y upgrade

#CLI utilities
apt-get -y install vim tmux wget htop sshsqlite3
#Python
apt-get -y install python3-pip python3-dev python3-setuptools
#GUI tools
apt-get -y install idle3 sqlitebrowser

apt-get -y install xrdp realvnc-vnc-server realvnc-vnc-client

if [[ $cpu == 'armv7l' ]] || [[ $cpu == 'armv6l' ]]
then

  apt-get -y install avahi-daemon python-rpi.gpio python3-rpi.gpio
  
  #change the locale
  sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/default/keyboard
  locale-gen en_US.UTF-8
  update-locale en_US.UTF-8
  #change the keyboard layout
  sed -i 's/XKBLAYOUT="gb"/XKBLAYOUT="us"/' /etc/default/keyboard
  timedatectl set-timezone America/New_York
  sed -i 's/ClockFmt=%R/ClockFmt=%r/' /home/pi/.config/lxpanel/LXDE-pi/panels/panel
  
  #install wifi controls for raspberry pi 1
  if [[ $cpu == 'armv6l' ]]
  then
    cp wpa_supplicant.conf /etc/wpa_supplicant.conf/wpa_supplicant.conf
  fi
  

fi

apt-get clean
