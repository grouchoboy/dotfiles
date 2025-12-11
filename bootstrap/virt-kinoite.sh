#!/usr/bin/env bash

sudo rpm-ostree upgrade
systemctl reboot
sudo rpm-ostree install qemu-kvm virt-manager virt-install libvirt virt-viewer libvirt-daemon-config-network  libvirt-daemon-kvm guestfs-tools python3-libguestfs virt-top
systemctl reboot
