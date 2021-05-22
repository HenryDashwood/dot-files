FROM ubuntu:20.04
RUN apt-get update --fix-missing
RUN apt-get install -y build-essential curl git libffi-dev libffi7 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5 sudo zsh

RUN useradd -m -s /bin/zsh ubuntu
RUN usermod -aG sudo ubuntu
RUN echo "ubuntu ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/toto
USER ubuntu 
WORKDIR /home/ubuntu
RUN git config --global user.email hcndashwood@gmail.com && git config --global user.name HenryDashwood
RUN git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
COPY ../../configs/.zshrc .

RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

RUN cabal update 
RUN cabal install hakyll
