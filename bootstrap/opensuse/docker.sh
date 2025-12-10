#!/usr/bin/env bash

sudo zypper install docker docker-compose docker-buildx

sudo systemctl enable --now docker.socket
# sudo usermod -G docker -a $USER
# newgrp docker
# sudo systemctl restart docker
