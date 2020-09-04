sudo apt update -y
sudo apt install -y fail2ban ufw
sudo ufw allow ssh
sudo ufw enable
sudo ufw allow 8888

sudo apt install -y zsh make build-essential libssl-dev zlib1g-dev \
	libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev\
	libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl\
	git


if [ ! -d ~/.oh-my-zsh ]; then
	chsh -s /usr/bin/zsh
	git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
	cp .vimrc ~/.vimrc
	cp .zshrc ~/.zshrc
fi
if [ ! -d ~/.pyenv ]; then
        git clone https://github.com/pyenv/pyenv.git ~/.pyenv
        git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
fi

source ~/.zshrc

if [ ! -d ~/.pyenv/versions/3.8.5 ]; then
        pyenv install 3.8.5
	pyenv virtualenv 3.8.5 py385
fi	
