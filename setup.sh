apt update -y
apt install -y make build-essential libssl-dev zlib1g-dev \
	libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev\
	libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl\
	git
DIRECTORY=
if [ ! -d ~/.pyenv ]; then
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
fi

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

if [ ! -d ~/.pyenv/versions/3.8.5 ]; then
	pyenv install 3.8.5
	pyenv virtualenv 3.8.5 py385
fi

source ~/.bashrc