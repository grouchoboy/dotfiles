#!/usr/bin/env bash

# https://neovim.io/doc/install/#install-from-source

set -eu

sudo dnf -y install ninja-build cmake gcc make gettext curl glibc-gconv-extra git

# make CMAKE_BUILD_TYPE=Release
# sudo make install
# sudo rm /usr/local/bin/nvim
# sudo rm -r /usr/local/share/nvim/
#
# mkdir -p ~/.config/nvim/parser
# git clone --depth=1 https://github.com/tree-sitter/tree-sitter-go.git
# tree-sitter build
# cp go.so ~/.config/nvim/parser/go.so
#
# mv highlights.scm ~/dotfiles/config/nvim/queries/go/
# mv tags.scm ~/dotfiles/config/nvim/queries/go/
#
# git clone --depth=1 https://github.com/tree-sitter-grammars/tree-sitter-lua.git
# tree-sitter build
# cp lua.so ~/.config/nvim/parser/lua.so

