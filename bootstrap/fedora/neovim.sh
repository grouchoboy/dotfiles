#!/usr/bin/env bash

# https://neovim.io/doc/install/#install-from-source

set -eu

sudo dnf -y install ninja-build cmake gcc make gettext curl glibc-gconv-extra git

# make CMAKE_BUILD_TYPE=Release
# sudo make install
# sudo rm /usr/local/bin/nvim
# sudo rm -r /usr/local/share/nvim/
