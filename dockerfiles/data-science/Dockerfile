FROM --platform=linux/amd64 python:3.9-slim
RUN apt-get update --fix-missing
RUN DEBIAN_FRONTEND="noninteractive" TZ="Europe/London" apt install -y build-essential cmake curl git make libssl-dev \
    libbz2-dev libreadline-dev libsqlite3-dev libncurses5-dev libncursesw5-dev libffi-dev liblzma-dev llvm \
    protobuf-compiler sudo tk-dev unzip vim wget xz-utils zlib1g-dev zsh

RUN useradd -m -s /bin/zsh ubuntu
RUN usermod -aG sudo ubuntu
RUN echo "ubuntu ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/toto
USER ubuntu
WORKDIR /home/ubuntu
RUN sudo chown -R ubuntu /home/ubuntu
    
RUN git config --global user.email hcndashwood@gmail.com && git config --global user.name HenryDashwood

RUN git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
COPY .zshrc .

RUN export PATH="$PATH:/home/ubuntu/.local/bin"
RUN pip install -U pip wheel
RUN pip install -U black datasets fastapi flake8 isort pandas scipy sklearn torch transformers typer

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install
RUN rm awscliv2.zip
