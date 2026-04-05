#!/bin/bash

sudo dnf group install --with-optional virtualization
sudo systemctl enable --now libvirtd
sudo usermod -a -G libvirt $USER
newgrp libvirt

# sudo iptables -S FORWARD
# sudo iptables -P FORWARD ACCEPT

