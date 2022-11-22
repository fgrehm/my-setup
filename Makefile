.PHONY: all
all: preferences packages home

.PHONY: preferences
preferences:
	(cd preferences && $(MAKE) all)

.PHONY: packages
packages:
	(cd packages && $(MAKE) all)

.PHONY: home
home:
	(cd home && $(MAKE) all)
