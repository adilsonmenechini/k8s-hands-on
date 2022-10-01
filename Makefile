.PHONY: k3d cluster disable-traefik clean sealed-secrets kustomize

name=""
namespace=""
local='.'
type=""
kustomize=$(shell which kustomize)
k3d=$(shell which k3d)

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' 
##
## ------------------------------------
## Cluster
## ------------------------------------

# make kustomize - Download kustomize
kustomize:
	@if [ -z ${kustomize} ]; then curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash ; \
	sudo mv kustomize /usr/local/bin; fi;

# make k3d - Download k3d
k3d:kustomize
	@if [ -z ${k3d} ]; then wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash; fi;

## make cluster - Create cluster k3d, with the example k3d.yaml
cluster:k3d
	curl https://raw.githubusercontent.com/adilsonmenechini/k8s-hands-on/main/k3d.yaml | k3d cluster create --config -

## make disable-traefik - Create cluster k3d, with the example k3d.yaml whitout traefik
disable-traefik:k3d
	curl https://raw.githubusercontent.com/adilsonmenechini/k8s-hands-on/main/k3d.yaml | k3d cluster create --config - \
	--k3s-arg "--disable=traefik@server:0"

## make clean - Delete cluster k3d
clean:
	curl https://raw.githubusercontent.com/adilsonmenechini/k8s-hands-on/main/k3d.yaml | k3d cluster delete --config -
	docker rmi $$(docker images -q)
	find ./ -name charts -exec rm -rf {} \;

#
# ------------------------------------
# Crete samples kustomize
# ------------------------------------
# make creater name=expatches namespace=default local=kustomize type=patches|helmcharts - create folder templates
creater:
	mkdir -p ${local}/${name}
	cp -rf .samples/${type}/* ${local}/${name}
	find ${local}/${name}/ -exec sed -i 's/#namespace#/${namespace}/g' {} \;
	find ${local}/${name}/ -exec sed -i 's/#name#/${name}/g' {} \;

