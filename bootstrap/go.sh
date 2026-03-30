#!/bin/bash

echo "Installing the last available version of go"
mise use -g go@$(mise ls-remote go | tail -n 1)

