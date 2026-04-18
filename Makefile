.PHONY: bash syncconfig clonetpm

bash:
	bash scripts/setupbash.sh

syncconfig:
	bash scripts/sync

clonetpm:
	bash scripts/clonetpm.sh

