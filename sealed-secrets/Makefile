.PHONY: install

sealed-version=0.18.4

install: 
	wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v${sealed-version}/kubeseal-${sealed-version}-linux-amd64.tar.gz
	tar -xvzf kubeseal-${sealed-version}-linux-amd64.tar.gz kubeseal
	sudo install -m 755 kubeseal /usr/local/bin/kubeseal
	rm -rf kubeseal-${sealed-version}-linux-amd64.tar.gz kubeseal
	kubeseal --version

download:
	helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
	helm repo update
	helm install sealed-secrets --set-string fullnameOverride=sealed-secrets-controller sealed-secrets/sealed-secrets --namespace kube-system
