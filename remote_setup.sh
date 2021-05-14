PROVIDER=$1
USERNAME=$2
IP=$3
PRIVATE_KEY=$4

function createsshuser() {
	useradd -m -s /bin/bash $1
	passwd $1
	usermod -aG sudo $1
	mkdir /home/$1/.ssh
	ssh-keyscan -t rsa github.com >> /home/$1/.ssh/known_hosts
	chmod -R 777 /home/$1/.ssh
}

function security() {
	sudo -S apt install -y fail2ban ufw
	sudo -S ufw allow ssh
	sudo -S ufw --force enable
	sudo -S ufw allow 8888
}

function setupzsh() {
	sudo -S apt install -y zsh make build-essential libssl-dev zlib1g-dev \
		libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
		libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl \
		git cmake protobuf-compiler

	git config --global user.email hcndashwood@gmail.com
	git config --global user.name HenryDashwood

	if [ ! -d ~/.oh-my-zsh ]; then
		git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
		cp ~/dot-files/.vimrc ~/.vimrc
		cp ~/dot-files/.zshrc ~/.zshrc
		sudo chsh -s /usr/bin/zsh $1
	fi
}

function setuppython() {
	if [ ! -d ~/.pyenv ]; then
		git clone https://github.com/pyenv/pyenv.git ~/.pyenv
		git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
	fi

	source ~/.zshrc

	if [ ! -d ~/.pyenv/versions/3.9.4 ]; then
		pyenv install 3.9.4
		pyenv virtualenv 3.9.4 py394
		/home/$USERNAME/.pyenv/versions/3.9.4/envs/py394/bin/python3.9 -m pip install --upgrade pip wheel
		pyenv activate py394
	fi
}

if [ $PROVIDER == "EC2" ]
then {
	scp -i $PRIVATE_KEY ~/.ssh/id_ed25519 $USERNAME@$IP:~/.ssh
	ssh -i $PRIVATE_KEY $USERNAME@$IP "sudo -S apt update -y"
	ssh -i $PRIVATE_KEY $USERNAME@$IP "ssh-keyscan github.com >> ~/.ssh/known_hosts"
	ssh -i $PRIVATE_KEY $USERNAME@$IP "git clone git@github.com:HenryDashwood/dot-files.git"
	ssh -i $PRIVATE_KEY $USERNAME@$IP "sh dot-files/setup_zsh.sh"
	ssh -i $PRIVATE_KEY $USERNAME@$IP "$(typeset -f setupzsh); setupzsh $USERNAME"
	ssh -i $PRIVATE_KEY $USERNAME@$IP "$(typeset -f setuppython); setuppython"
}
elif [ $PROVIDER == "DATACRUNCH" ] 
then {
	ssh -i $PRIVATE_KEY root@$IP "$(typeset -f createsshuser); createsshuser $USERNAME"
	scp ~/.ssh/id_ed25519 $USERNAME@$IP:~/.ssh
	ssh $USERNAME@$IP "sudo -S apt update -y"
	ssh $USERNAME@$IP "$(typeset -f security); security"
	ssh $USERNAME@$IP "git clone git@github.com:HenryDashwood/dot-files.git"
	ssh $USERNAME@$IP "$(typeset -f setupzsh); setupzsh $USERNAME"
	ssh $USERNAME@$IP "$(typeset -f setuppython); setuppython"
}
fi
