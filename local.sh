if [[ $UID -eq 0 ]]
then
	echo Root user!
	exit 1
fi


git config --global user.email "eugene@eugenemeidinger.com"
git config --global user.name "Eugene Meidinger"

python3 -m pip install -U discord.py

cd ../

git clone https://github.com/eugman/TysonBot.git
touch ./TysonBot/apikey.txt

git clone https://github.com/eugman/RoguelikeTest.git
