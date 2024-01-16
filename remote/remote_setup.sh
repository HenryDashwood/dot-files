PROVIDER=$1
USERNAME=$2
IP=$3
PRIVATE_KEY=$4

function createsshuser() {
	useradd -m $1
	usermod -aG sudo $1
	mkdir /home/$1/.ssh
	cp ~/.ssh/authorized_keys /home/$1/.ssh/
	chown -R $1:$1 /home/$1
	chmod 700 /home/$1/.ssh
	chmod 600 /home/$1/.ssh/authorized_keys
}

function security() {
	sudo -S apt install -y fail2ban ufw
	sudo -S ufw allow ssh
	sudo -S ufw --force enable
	sudo -S ufw allow 8888

}

function setupzsh() {
	sudo -S apt-get install -y \
		build-essential cmake curl git libbz2-dev libncurses5-dev liblzma-dev libncursesw5-dev libffi-dev \
		libreadline-dev libsqlite3-dev libssl-dev libxmlsec1-dev libxml2-dev llvm make protobuf-compiler \
		python3-openssl tk-dev unzip wget xz-utils zlib1g-dev zsh

	git config --global user.email hcndashwood@gmail.com
	git config --global user.name HenryDashwood
	
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	unzip awscliv2.zip
	sudo ./aws/install
	rm awscliv2.zip

	if [ ! -d ~/.oh-my-zsh ]; then
		git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
		sudo chsh -s /usr/bin/zsh $1
	fi
}

function setuppython() {
	if [ ! -d ~/.pyenv ]; then
		git clone https://github.com/pyenv/pyenv.git ~/.pyenv
		git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
	fi

	source ~/.zshrc

	if [ ! -d ~/.pyenv/versions/3.11.7 ]; then
		pyenv install 3.11.7
		pyenv virtualenv 3.11.7 py3117
		/home/$USERNAME/.pyenv/versions/3.11.7/envs/py3117/bin/python3.11 -m pip install --upgrade pip wheel
		echo 'export PYENV_ROOT="$HOME/.pyenv"' >> .profile
		echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> .profile
		echo 'eval "$(pyenv init --path)"' >> .profile
		echo 'export PYENV_ROOT="$HOME/.pyenv"' >> .zprofile
		echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> .zprofile
		echo 'eval "$(pyenv init --path)"' >> .zprofile
		pyenv activate py3117
	fi
}

if [ $PROVIDER == "EC2" ]
then {
	scp -i $PRIVATE_KEY $USERNAME@$IP:~/.ssh
	ssh -i $PRIVATE_KEY $USERNAME@$IP "chmod 400 /home/$USERNAME/.ssh/id_ed25519"
	ssh -i $PRIVATE_KEY $USERNAME@$IP "sudo -S apt update -y"
	ssh -i $PRIVATE_KEY $USERNAME@$IP "ssh-keyscan github.com >> ~/.ssh/known_hosts"
	scp -i $PRIVATE_KEY -r ../configs/shell/.zshrc $USERNAME@$IP:~/.zshrc
	scp -i $PRIVATE_KEY -r ../configs/shell/.vimrc $USERNAME@$IP:~/.vimrc
	ssh -i $PRIVATE_KEY $USERNAME@$IP "$(typeset -f setupzsh); setupzsh $USERNAME"
	ssh -i $PRIVATE_KEY $USERNAME@$IP "$(typeset -f setuppython); setuppython"
}
elif [ $PROVIDER == "DATACRUNCH" ] 
then {
	ssh -i $PRIVATE_KEY root@$IP "$(typeset -f createsshuser); createsshuser $USERNAME"
	ssh -i $PRIVATE_KEY $USERNAME@$IP "sudo -S apt update -y"

	scp -i $PRIVATE_KEY ~/.ssh/id_ed25519 $USERNAME@$IP:~/.ssh
	ssh -i $PRIVATE_KEY $USERNAME@$IP "chmod 400 /home/$USERNAME/.ssh/id_ed25519"

	ssh -i $PRIVATE_KEY $USERNAME@$IP "$(typeset -f security); security"

	scp -i $PRIVATE_KEY -r ../configs/shell/.zshrc $USERNAME@$IP:~/.zshrc
	scp -i $PRIVATE_KEY -r ../configs/shell/.vimrc $USERNAME@$IP:~/.vimrc

	ssh -i $PRIVATE_KEY $USERNAME@$IP "$(typeset -f setupzsh); setupzsh $USERNAME"
	ssh -i $PRIVATE_KEY $USERNAME@$IP "$(typeset -f setuppython); setuppython"
}
fi
