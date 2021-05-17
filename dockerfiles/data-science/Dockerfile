FROM python:3.9-slim
RUN apt-get update --fix-missing
RUN DEBIAN_FRONTEND="noninteractive" TZ="Europe/London" apt install -y build-essential cmake curl git make libssl-dev \
    libbz2-dev libreadline-dev libsqlite3-dev libncurses5-dev libncursesw5-dev libffi-dev liblzma-dev llvm \
    protobuf-compiler tk-dev vim wget xz-utils zlib1g-dev zsh

RUN useradd -m -s /bin/zsh ubuntu
RUN usermod -aG sudo ubuntu

USER ubuntu

WORKDIR /home/ubuntu
    
RUN git config --global user.email hcndashwood@gmail.com && git config --global user.name HenryDashwood

RUN git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv
RUN git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
COPY .zshrc .