.PHONY: all
all: preferences packages home nvim dev

.PHONY: preferences
preferences:
	(cd preferences && $(MAKE) all)

.PHONY: packages
packages:
	(cd packages && $(MAKE) all)

.PHONY: home
home:
	(cd home && $(MAKE) all)

.PHONY: dev
dev:
	(cd dev && $(MAKE) all)

.PHONY: nvim
nvim:
	(cd nvim && $(MAKE) all)
