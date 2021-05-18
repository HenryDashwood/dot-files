FROM amd64/haskell:8
# RUN apt-get update --fix-missing
# RUN apt-get install -y curl git sudo zsh

# RUN useradd -m -s /bin/zsh ubuntu
# RUN usermod -aG sudo ubuntu
# RUN echo "ubuntu ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/toto
# USER ubuntu 
# WORKDIR /home/ubuntu

# RUN git config --global user.email hcndashwood@gmail.com && git config --global user.name HenryDashwood
# RUN git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
# COPY .zshrc .

RUN cabal update 
# RUN cabal install hakyll