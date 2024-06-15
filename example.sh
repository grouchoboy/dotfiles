#!/bin/bash

HOST=$(awk -F= '/^NAME=/{print $2}' /etc/os-release | tr -d '"')
echo $HOST

if [ "$HOST" = "Arch Linux" ]; then
    echo "We are on arch"
fi
