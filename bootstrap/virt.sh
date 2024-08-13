sudo dnf group install --with-optional virtualization
sudo systemctl enable --now libvirtd
sudo usermod -a -G libvirt manu
newgrp libvirt
