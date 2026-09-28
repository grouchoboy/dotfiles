.PHONY: switch test boot update check help

HOSTNAME ?= $(shell hostname)

help:
	@echo "Available commands for NixOS flake configuration:"
	@echo "  make switch    - Apply and switch to current machine's configuration"
	@echo "  make test      - Test configuration without adding to boot menu"
	@echo "  make boot      - Apply configuration on next reboot"
	@echo "  make update    - Update flake.lock inputs"
	@echo "  make check     - Validate flake configuration"

switch:
	sudo nixos-rebuild switch --flake .#$(HOSTNAME)

test:
	sudo nixos-rebuild test --flake .#$(HOSTNAME)

boot:
	sudo nixos-rebuild boot --flake .#$(HOSTNAME)

update:
	nix flake update

check:
	nix flake check
