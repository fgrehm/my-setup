.PHONY: all
all: remap-caps natural-scroll minimize-to-click

.PHONY: remap-caps
remap-caps:
	dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:ctrl_modifier']"

.PHONY: natural-scroll
natural-scroll:
	gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
	gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true

.PHONY: minimize-to-click
minimize-to-click:
	gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
