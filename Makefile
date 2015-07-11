all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""   1. make server       - run moviemasher server

server: port serverplay

serverplay:
	ansible-playbook moviemasher.yml

prep: bootstrap docker

docker:
	ansible-playbook docker.yml

bootstrap:
	ansible-playbook bootstrapAnsible.yml

port:
	@while [ -z "$$port" ]; do \
		read -r -p "Enter the port of the Rancher server you wish to associate with these Rancher agents this can be left blank [port]: " port; echo "$$port">>port; cat port; \
	done ;
