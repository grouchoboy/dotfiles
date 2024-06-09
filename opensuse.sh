sudo zypper up -y

# install 1password
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo zypper addrepo https://downloads.1password.com/linux/rpm/stable/x86_64 1password
sudo zypper install -y 1password


# ssh
mkdir -p /home/manu/.ssh && \
cp ~/Downloads/id_rsa ~/.ssh/ && \
cp ~/Downloads/id_rsa.pub ~/.ssh/ && \
chmod 700 ~/.ssh && chmod 600 ~/.ssh/id_rsa && chmod 644 ~/.ssh/id_rsa.pub


# install utils
sudo zypper install -y git neovim fzf ripgrep inotify-tools zsh bat zellij lazygit alacritty

# erlang, go, ...
curl https://mise.run | sh

# erlang dependencies
sudo zypper install -y unzip make automake autoconf gcc-c++ ncurses-devel
sudo zypper install -y libssh-devel libopenssl-devel
sudo zypper install -y wxGTK3-3_2-devel
sudo zypper install -y fop libxml2-tools libxslt-tools


# docker
sudo zypper install -y docker docker-compose docker-compose docker-compose-switch && \
    sudo systemctl enable docker && \
    sudo usermod -G docker -a $USER && \
    newgrp docker && \
    sudo systemctl restart docker

# lazydocker
cd ~/Downloads
LAZYDOCKER_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -sLo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_${LAZYDOCKER_VERSION}_Linux_x86_64.tar.gz"
tar -xf lazydocker.tar.gz lazydocker
mv lazydocker ~/.local/bin
rm lazydocker.tar.gz
cd -

# codecs
sudo zypper install -y opi
opi codecs

