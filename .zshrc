if [ $USERNAME = "root" ]; then
 export ZSH="/$USERNAME/.oh-my-zsh"
else
 export ZSH="/home/$USERNAME/.oh-my-zsh"
fi
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git docker)
source $ZSH/oh-my-zsh.sh
alias dc='docker-compose'

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"
