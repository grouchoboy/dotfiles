#!/bin/bash

echo "Installing the last available version of node"
mise use -g node@$(mise ls-remote node | tail -n 1)

