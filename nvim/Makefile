.PHONY: all
all: pkg configs

.PHONY: pkg
pkg:
	sudo snap install nvim --classic

.PHONY: configs
configs:
	[ -L ~/.config/nvim ] && echo '.config/nvim already symlinked' || ln -s `pwd` ~/.config/nvim
