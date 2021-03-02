if [ ! -d ~/.pyenv ]; then
        git clone https://github.com/pyenv/pyenv.git ~/.pyenv
        git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
fi

if [ ! -d ~/.pyenv/versions/3.9.1 ]; then
        pyenv install 3.9.1
	pyenv virtualenv 3.9.1 py391
	pyenv activate py391
	code --install-extension ms-python.python
	code --install-extension ms-python.vscode-pylance
fi