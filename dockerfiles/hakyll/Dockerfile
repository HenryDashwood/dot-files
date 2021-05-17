FROM ubuntu:20.04
RUN apt-get update --fix-missing
RUN apt-get install -y curl git haskell-platform sudo zsh
WORKDIR /root
RUN git config --global user.email hcndashwood@gmail.com && git config --global user.name HenryDashwood
RUN git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
COPY . .
RUN cabal update
RUN cabal install hakyll