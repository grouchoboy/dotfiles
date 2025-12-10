#!/usr/bin/env bash

systemctl --user enable --now podman.socket
distrobox assemble create --file arch.ini

