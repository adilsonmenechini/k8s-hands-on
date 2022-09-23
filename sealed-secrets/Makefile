.PHONY: kubeseal install 

sealed-version=0.18.4

include ../Makefile-templates
include ../Makefile

## ------------------------------------
## Sealed Secrets
## ------------------------------------
## make kubeseal
kubeseal: 
	wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v${sealed-version}/kubeseal-${sealed-version}-linux-amd64.tar.gz
	tar -xvzf kubeseal-${sealed-version}-linux-amd64.tar.gz kubeseal
	sudo install -m 755 kubeseal /usr/local/bin/kubeseal
	rm -rf kubeseal-${sealed-version}-linux-amd64.tar.gz kubeseal
	kubeseal --version
