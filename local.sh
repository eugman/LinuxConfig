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

if ! grep -q tmux ~/.bashrc
then
	cat .bashrc >> ~/.bashrc
fi
cd ../

python3 -m pip install -U discord.py

cd ../

git clone https://github.com/eugman/TysonBot.git
touch ./TysonBot/apikey.txt

git clone https://github.com/eugman/MMOLike.git
git clone https://github.com/eugman/mud-pi.git
