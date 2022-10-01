.PHONY: install delete
debug=false

## make debug debug=true
debug:
ifeq ($(debug), true)
	@kustomize build ./base --enable-helm
	@echo "---------------------------------------------------"
else
	@echo ""
endif
## make install
##   - debug=false|true 
##     ex: make install debug=true
install:debug
	kubectl kustomize ./base --enable-helm  | kubectl apply -f -
## make delete
delete:
	kubectl kustomize ./base --enable-helm  | kubectl delete -f -