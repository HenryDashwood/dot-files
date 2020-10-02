# dot-files
```
ssh -i ~/.ssh/id_ed25519 root@[IP_ADDRESS_OF_REMOTE_MACHINE]

adduser henry
usermod -aG sudo henry

Ctrl-d

scp ~/.ssh/id_ed25519 henry@[IP_ADDRESS_OF_REMOTE_MACHINE]:/home/henry/.ssh

ssh henry@[IP_ADDRESS_OF_REMOTE_MACHINE]

git clone git@github.com:HenryDashwood/dot-files.git

sh dot-files/setup.sh

Ctrl-d

ssh henry@[IP_ADDRESS_OF_REMOTE_MACHINE]

sh dot-files/setup.sh

pyenv activate py385
```
