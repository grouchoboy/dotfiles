#!/usr/bin/env bash

sudo pacman -Sy --noconfirm alacritty zsh nvim fzf inotify-tools podman docker docker-compose docker-buildx unzip inetutils distrobox vlc okular foliate mise wl-clipboard swappy obsidian rsync tmux btop flatpak gwenview fd stow transmission-qt nvim direnv pacman-contrib man-db power-profiles-daemon

sudo pacman -Sy --noconfirm gst-plugins-base gst-plugins-good gst-plugins-ugly gst-libav ffmpeg vlc vlc-plugins-all

sudo systemctl enable --now power-profiles-daemon.service
