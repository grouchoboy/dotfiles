cd ~
git clone git@github.com:grouchoboy/dotfiles.git

ln -s /home/manu/dotfiles/nvim /home/manu/.config/nvim
# mkdir /home/manu/.config/nvim
# ln -s /home/manu/dotfiles/init.lua /home/manu/.config/nvim/init.lua

ln -s /home/manu/dotfiles/alacritty /home/manu/.config/alacritty

ln -s /home/manu/dotfiles/ghostty /home/manu/.config/ghostty

ln -s /home/manu/dotfiles/zellij /home/manu/.config/zellij

ln -s /home/manu/dotfiles/lazygit /home/manu/.config/lazygit

ln -s /home/manu/dotfiles/sway /home/manu/.config/sway
ln -s /home/manu/dotfiles/swaylock /home/manu/.config/swaylock
ln -s /home/manu/dotfiles/waybar /home/manu/.config/waybar
ln -s /home/manu/dotfiles/rofi /home/manu/.config/rofi

ln -s $HOME/dotfiles/bat $HOME/.config/bat
bat cache --build
cd -

git config --global user.email "manu.pascual.luna@gmail.com"
git config --global user.name "Manu Pascual Luna"
