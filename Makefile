.PHONY: install cluster disable-traefik clean sealed-secrets

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

## Make install - Download k3d
install:
	wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

## Make cluster - Create cluster k3d, with the example k3d.yaml
cluster:
	@k3d cluster create --config k3d.yaml

## Make disable-traefik: - Create cluster k3d, with the example k3d.yaml whitout traefik
disable-traefik:
	@k3d cluster create --config k3d.yaml \
	--k3s-arg "--disable=traefik@server:0"

## Make disable-traefik: - Delete cluster k3d,
clean:
	@k3d cluster delete --config k3d.yaml 