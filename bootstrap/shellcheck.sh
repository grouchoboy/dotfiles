#!/bin/bash

echo "Installing the last available version of shellcheck"
mise use -g shellcheck@$(mise ls-remote shellcheck | tail -n 1)

