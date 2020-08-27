sudo apt update -y
sudo apt install -y fail2ban ufw
sudo ufw allow ssh
sudo ufw enable -y
sudo ufw allow 8888

sudo apt install -y zsh make build-essential libssl-dev zlib1g-dev \
	libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev\
	libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl\
	git

if [ ! -d ~/.oh-my-zsh ]; then
	wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
fi

if [ ! -d ~/.pyenv ]; then
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	grep -qxF 'export PYENV_ROOT="$HOME/.pyenv"' ~/.zshrc || echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
	grep -qxF 'export PATH="$PYENV_ROOT/bin:$PATH"' ~/.zshrc || echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
	grep -qxF 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' ~/.zshrc || echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.zshrc
	sudo git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
	source ~/.zshrc
	grep -qxF 'eval "$(pyenv virtualenv-init -)"' ~/.zshrc || echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
	source ~/.zshrc
fi

if [ ! -d ~/.pyenv/versions/3.8.5 ]; then
	pyenv install 3.8.5
	pyenv virtualenv 3.8.5 py385
fi

grep -qxF 'eval "$(pyenv activate py385)"' ~/.zshrc || echo 'eval "$(pyenv activate py385)"' >> ~/.zshrc
source ~/.zshrc