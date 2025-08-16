sudo pacman -S zellij alacritty zsh nvim fzf inotify-tools podman docker unzip inetutils distrobox \ 
    vlc okular foliate mise wl-clipboard swappy obsidian rsync tmux btop power-profiles-daemon flatpak

sudo systemctl enable --now power-profiles-daemon.service

yay -S 1password
 
# codecs
sudo pacman -S gst-plugins-base gst-plugins-good gst-plugins-ugly gst-libav ffmpeg vlc vlc-plugins-all

sudo pacman -S bluez bluez-utils blueberry

sudo pacman -S lxappearance qt6ct hyprpaper hyprpolkitagent hyprsunset hyprlock papirus-icon-theme cliphist lf hyprpicker nwg-look fwupd archlinux-xdg-menu
# systemctl --user enable --now hyprpolkitagent.service
# systemctl --user enable --now hyprsunset.service

sudo pacman -S snap-pac
yay -S grub-btrfs btrfs-assistant
# sudo grub-mkconfig -o /boot/grub/grub.cfg
# grub-btrfs
# sudo systemctl enable --now grub-btrfsd

