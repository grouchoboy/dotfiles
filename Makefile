.PHONY: agents syncconfig clonetpm

DOTFILES := $(HOME)/dotfiles

agents:
	@echo "symlink agents directory (skills)"
	ln -s $(DOTFILES)/agents $(HOME)/.agents	

syncconfig:
	bash scripts/sync

clonetpm:
	bash scripts/clonetpm.sh

