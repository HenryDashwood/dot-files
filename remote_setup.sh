function createsshuser()
{
	useradd -m -s /bin/bash $1
	passwd $1
	usermod -aG sudo $1
	mkdir /home/$1/.ssh
	ssh-keyscan -t rsa github.com >> /home/$1/.ssh/known_hosts
	chmod -R 777 /home/$1/.ssh
}

USERNAME=$1
PASSWORD=$2
IP=$3

ssh -i ~/datacrunch root@$IP "$(typeset -f createsshuser); createsshuser $USERNAME $PASSWORD"

scp ~/.ssh/id_ed25519 $USERNAME@$IP:~/.ssh

ssh $USERNAME@$IP "git clone git@github.com:HenryDashwood/dot-files.git && sh dot-files/setup_zsh.sh"

ssh $USERNAME@$IP "zsh dot-files/setup_python.sh"