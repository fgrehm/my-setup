.PHONY: all
all: docker gopls

.PHONY: docker
docker:
	[ -f /usr/share/keyrings/docker-archive-keyring.gpg ] && echo 'docker gpg already configured' || curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo "deb [arch=$$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	sudo apt-cache policy docker-ce
	sudo apt-get install docker-ce docker-compose
	sudo usermod -aG docker "$${USER}"

.PHONY: gopls
gopls:
	go install golang.org/x/tools/gopls@latest
