.PHONY: all
all: preferences packages home nvim

.PHONY: preferences
preferences:
	(cd preferences && $(MAKE) all)

.PHONY: packages
packages:
	(cd packages && $(MAKE) all)

.PHONY: home
home:
	(cd home && $(MAKE) all)

.PHONY: nvim
nvim:
	(cd nvim && $(MAKE) all)
