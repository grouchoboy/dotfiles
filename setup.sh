
# install 1password
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf -y install 1password

sudo dnf -y install git neovim vim-enhanced zsh kate fzf ripgrep podman podman-compose inotify-tools

# add flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# install firefox from flathub
flatpak install -y flathub org.mozilla.firefox

# log into firefox account using 1password
# download ssh keys from 1password (searh for 'ssh personal')

mkdir -p /home/manu/.ssh
cp ~/Downloads/id_rsa ~/.ssh/
cp ~/Downloads/id_rsa.pub ~/.ssh/

chmod 700 ~/.ssh && chmod 600 ~/.ssh/id_rsa && chmod 644 ~/.ssh/id_rsa.pub

# clone dotfiles
git clone git@github.com:grouchoboy/dotfiles.git

# ssh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## enable ssh agent
mkdir -p ~/.config/systemd/user
ln -s /home/manu/dotfiles/docs/ssh-agent.service /home/manu/.config/systemd/user
systemctl --user enable --now ssh-agent.service

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm ~/.zshrc
ln -s /home/manu/dotfiles/.zshrc /home/manu/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# base 16 theme for konsole
ln -s /home/manu/dotfiles/base16-ocean.colorscheme /home/manu/.local/share/konsole

git config --global user.email "manu.pascual.luna@gmail.com"
git config --global user.name "Manu Pascual Luna"

ln -s /home/manu/dotfiles/nvim /home/manu/.config/nvim
ln -s /home/manu/dotfiles/lazy-nvim /home/manu/.config/nvim

# install fira sans
wget https://github.com/mozilla/Fira/archive/refs/tags/4.202.zip
unzip 4.202.zip

mkdir -p ~/.local/share/fonts
cp -r Fira-4.202/ttf ~/.local/share/fonts/FiraSans

## install jetbrains nerd fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
unzip JetBrainsMono.zip -d JetBrainsMono
cp -r JetBrainsMono ~/.local/share/fonts


## install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

sudo dnf group install -y 'Development Tools' 'C Development Tools and Libraries'
sudo dnf install -y autoconf ncurses-devel wxGTK-devel wxBase openssl-devel java-1.8.0-openjdk-devel  \
    libiodbc unixODBC-devel erlang-odbc libxslt fop

# install erlang
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf install erlang 26.2.4
asdf global erlang 26.2.4

# install elixir
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install elixir 1.16.2
asdf global elixir 1.16.2

# install vscode

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

dnf check-update
sudo dnf -y install code


# silverblue

rpm-ostree install distrobox zsh fzf ripgrep

# inside distrobox

distrobox create --image fedora:40 -n dev

# configure zellij
# mkdir ~/.config/zellij
# zellij setup --dump-config > ~/.config/zellij/config.kdl
ln -s /home/manu/dotfiles/zellij /home/manu/.config/zellij

# alacritty
ln -s /home/manu/dotfiles/alacritty /home/manu/.config/alacritty

# lazygit
ln -s /home/manu/dotfiles/lazygit /home/manu/.config/lazygit

# bat
ln -s $HOME/dotfiles/bat $HOME/.config/bat
# wget -P /home/manu/dotfiles/bat/themes https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
bat cache --build
