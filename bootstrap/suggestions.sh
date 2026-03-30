#!/bin/bash

curl -L https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly.tar.xz | tar xJf -
mkdir -p ~/.local/share/blesh
mv -f ble-nightly*/* ~/.local/share/blesh/
# echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc
# source ~/.bashrc

