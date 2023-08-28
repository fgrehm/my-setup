.PHONY: all
all: pkg configs

.PHONY: pkg
pkg:
	sudo snap install neovim --classic
	# sudo add-apt-repository ppa:neovim-ppa/unstable
	# sudo apt update
	# sudo apt-get install -y neovim

.PHONY: configs
configs:
	[ -L ~/.config/nvim ] && echo '.config/nvim already symlinked' || ln -s `pwd` ~/.config/nvim
