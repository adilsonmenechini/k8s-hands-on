# patches

You should now be able to create patches.

## Reference
* [patches]()

## Install the patches:
### Makefile

```
❯ make help 

 ------------------------------------
 patches
 ------------------------------------
 make install
   - debug=false|true
     ex: make install debug=true
 make delete
```

## Validate

### Check

```
❯ kubectl get pods,deploy,svc -n default                                       

```
### Get the patches server URL by running these commands in the same shell

```
kubectl port-forward -n default svc/patches-server 8080:80
```
> http://localhost:8080/

