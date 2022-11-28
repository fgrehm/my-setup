.PHONY: all
all: folders bashrc tmux git

.PHONY: folders
folders:
	mkdir -p "$${HOME}/bin"
	mkdir -p "$${HOME}/.tokens"

.PHONY: bashrc
bashrc:
	$$(grep -q `pwd` ~/.bashrc) && echo '.bashrc already configured' || echo "source `pwd`/bashrc" >> ~/.bashrc

.PHONY: tmux
tmux:
	[ -L ~/.tmux.conf ] && echo '.tmux.conf already symlinked' || ln -s `pwd`/tmux.conf ~/.tmux.conf

.PHONY: git
git:
	[ -L ~/.gitconfig ] && echo '.gitconfig already symlinked' || ln -s `pwd`/gitconfig ~/.gitconfig
	git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
