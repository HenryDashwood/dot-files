sudo apt update -y
sudo apt install -y fail2ban ufw
sudo ufw allow ssh
sudo ufw enable
sudo ufw allow 8888

sudo apt install -y zsh make build-essential libssl-dev zlib1g-dev \
	libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev\
	libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl\
	git

git config --global user.email hcndashwood@gmail.com
git config --global user.name HenryDashwood

if [ ! -d ~/.oh-my-zsh ]; then
	git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
	cp ~/dot-files/.vimrc ~/.vimrc
	cp ~/dot-files/.zshrc ~/.zshrc
	chsh -s /usr/bin/zsh
fi
if [ ! -d ~/.pyenv ]; then
        git clone https://github.com/pyenv/pyenv.git ~/.pyenv
        git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
fi

source ~/.zshrc

if [ ! -d ~/.pyenv/versions/3.8.6 ]; then
        pyenv install 3.8.6
	pyenv virtualenv 3.8.6 py386
	pyenv activate py386
	code --install-extension ms-python.python
	code --install-extension ms-python.vscode-pylance
fi	
