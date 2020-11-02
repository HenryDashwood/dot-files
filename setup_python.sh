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