.PHONY: setup dev-recreate dev-create dev-destroy

setup:
	./scripts/setup-server.sh

dev-destroy:
	colima delete -f

dev-create:
	colima start -m 8 --network-address --kubernetes  --k3s-arg="servicelb,traefik,local-storage" # --mount ${PWD}/data:/data:w

dev-recreate: dev-destroy dev-create setup

server-install:
	curl -sfL https://get.k3s.io | sh -s - --disable traefik,local-storage,helm-controller
