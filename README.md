# Kubernetes 
[ Hands on ] kubernetes sample repository


## TODO
* [Sealed Secrets](sealed-secrets/README.md)
* [Prometheus](prometheus/README.md)
* [Vault](vault/README.md)

## MakeFile
```
> make help 

 ------------------------------------
 Cluster
 ------------------------------------
 !? checks or installs if you do not have k3d and kustomize

 make cluster - Create cluster k3d, with the example k3d.yaml
 make disable-traefik - Create cluster k3d, with the example k3d.yaml whitout traefik
 make clean - Delete cluster k3d
```