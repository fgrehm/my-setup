PACKAGES := tmux git curl chromium-browser apt-transport-https ca-certificates build-essential fzf ripgrep jq

SNAPS := slack spotify
CLASSIC_SNAPS := go

.PHONY: all
all: dist-upgrade packages docker slack

.PHONY: dist-upgrade
dist-upgrade:
	sudo apt-get update
	sudo apt-get dist-upgrade

.PHONY: packages
packages:
	sudo apt-get install -y $(PACKAGES)

.PHONY: docker
docker:
	[ -f /usr/share/keyrings/docker-archive-keyring.gpg ] && echo 'docker gpg already configured' || curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo "deb [arch=$$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	sudo apt-cache policy docker-ce
	sudo apt-get install docker-ce
	sudo usermod -aG docker "$${USER}"

.PHONY: snaps
snaps:
	sudo snap install $(SNAPS)
	sudo snap install --classic $(CLASSIC_SNAPS)
