# dot-files

```
ssh -i [PATH_TO_SSH_KEY] root@[IP_ADDRESS_OF_REMOTE_MACHINE]

adduser henry
usermod -aG sudo henry

Ctrl-d

ssh henry@[IP_ADDRESS_OF_REMOTE_MACHINE] "mkdir -p .ssh"

scp [PATH_TO_SSH_KEY] henry@[IP_ADDRESS_OF_REMOTE_MACHINE]:/home/henry/.ssh

ssh henry@[IP_ADDRESS_OF_REMOTE_MACHINE]

git clone git@github.com:HenryDashwood/dot-files.git

sh dot-files/setup_zsh.sh

Ctrl-d

ssh henry@[IP_ADDRESS_OF_REMOTE_MACHINE]

sh dot-files/setup_python.sh
```
