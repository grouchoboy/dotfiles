#!/usr/bin/env bash

sudo rpm-ostree upgrade
systemctl reboot
sudo rpm-ostree install qemu virt-manager libvirt virt-viewer libvirt-daemon-config guestfs-tools libguestfs-tools python3-libguestfs virt-top
systemctl reboot
