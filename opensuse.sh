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

sudo zypper install -y unzip make automake autoconf gcc-c++ ncurses-devel
sudo zypper install -y libssh-devel libopenssl-devel
sudo zypper install -y wxGTK3-3_2-devel
sudo zypper install -y fop libxml2-tools libxslt-tools

curl https://mise.run | sh
