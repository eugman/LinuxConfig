if [[ $UID -eq 0 ]]
then
	echo Root user!
	exit 1
fi

cd dotfiles

if [[ ! -e ~/.gitconfig ]]
then
	cp .gitconfig ~/.gitconfig
fi
if [[ ! -e ~/.tmux.conf ]]
then
	cp .tmux.conf ~/.tmux.conf
fi

if [[ ! -e ~/.vimrc ]]
then
	cp .vimrc ~/.vimrc
fi

if ! grep -q tmux ~/.bashrc
then
	cat .bashrc >> ~/.bashrc
fi
cd ../

python3 -m pip install -U discord.py
python3 -m pip install -U flask
python3 -m pip install -U flask-SQLAlchemy
python3 -m pip install -U trello
python3 -m pip install -U requests

cd ../

git clone https://github.com/eugman/TysonBot.git
touch ./TysonBot/apikey.txt

git clone https://github.com/eugman/MMOLike.git
git clone https://github.com/eugman/mud-pi.git
git clone https://github.com/eugman/EugeneQuest.git
git clone https://github.com/eugman/CLIMenu

git clone https://github.com/oysttyer/oysttyer.git
#https://neiloosten.com/2016/02/install-oysttyer-command-line-twitter/

vim-addons install python-jedi

#curl -sSL https://get.docker.com | sh

if [[ ! -e "~/.ssh" ]]
then

	ssh-keygen
	touch ~/.ssh/authorized-keys
	cat ~/LinuxConfig/publickeys/worklaptop.pub >> ~/.ssh/authorizedkeys
	cat ~/LinuxConfig/publickeys/gamingpc.pub >> ~/.ssh/authorizedkeys

fi
git clone https://github.com/pallets/jinja.git
cp jinja/ext/Vim/jinja.vim /home/pi/.vim/plugin/
