sudo apt update -y
sudo apt install -y fail2ban ufw
sudo ufw allow ssh
sudo ufw --force enable
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
