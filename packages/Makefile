PACKAGES := tmux git curl chromium-browser apt-transport-https ca-certificates build-essential fzf ripgrep jq xclip htop ubuntu-restricted-extras parallel
SNAPS := slack spotify

.PHONY: all
all: dist-upgrade packages snaps

.PHONY: dist-upgrade
dist-upgrade:
	sudo apt-get update
	sudo apt-get dist-upgrade

.PHONY: packages
packages:
	sudo apt-get install -y $(PACKAGES)

.PHONY: snaps
snaps:
	sudo snap install $(SNAPS)
