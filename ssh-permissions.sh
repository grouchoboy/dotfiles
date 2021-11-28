#!/bin/bash

echo "Cheking if ~/.ssh directory exists"
if [ -d ~/.ssh ]; then
    echo "~/.ssh exists"

    if [ -f ~/.ssh/id_rsa ]; then
        while true; do
            read -p "Do you want to modify the permissions of ~/.ssh? [y/n] " yn
            case $yn in
                [Yy]* ) 
                    echo "chmod 700 ~/.ssh"
                    chmod 700 ~/.ssh; break;;
                [Nn]* ) echo "Nothing to do"; break;;
                * ) echo "Please answer 'y' or 'n'";;
            esac
        done
    fi

    echo "Checking if ~/.ssh/id_rsa exists"
    if [ -f ~/.ssh/id_rsa ]; then
        while true; do
            read -p "Do you want to modify the permissions of ~/.ssh/id_rsa? [y/n] " yn
            case $yn in
                [Yy]* ) 
                    echo "chmod 600 ~/.ssh/id_rsa"
                    chmod 600 ~/.ssh/id_rsa; break;;
                [Nn]* ) echo "Nothing to do"; break;;
                * ) echo "Please answer 'y' or 'n'";;
            esac
        done
    fi

    echo "Checking if ~/.ssh/id_rsa.pub exists"
    if [ -f ~/.ssh/id_rsa.pub ]; then
        while true; do
            read -p "Do you want to modify the permissions of ~/.ssh/id_rsa.pub? [y/n] " yn
            case $yn in
                [Yy]* ) 
                    echo "chmod 644 ~/.ssh/id_rsa.pub"
                    chmod 644 ~/.ssh/id_rsa.pub; break;;
                [Nn]* ) echo "Nothing to do"; break;; 
                * ) echo "Please answer 'y' or 'n'";;
            esac
        done
    fi
fi
