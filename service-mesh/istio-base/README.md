# istio-base

You should now be able to create istio-base.

## Reference
* [istio-base]()

## Install the istio-base:
### Makefile

```
❯ make help 

 ------------------------------------
 istio-base
 ------------------------------------
 make install
   - debug=false|true
     ex: make install debug=true
 make delete
```

## Validate

### Check

```
❯ kubectl get pods,deploy,svc -n istio-system                                       

```
### Get the istio-base server URL by running these commands in the same shell

```
kubectl port-forward -n istio-system svc/istio-base-server 8080:80
```
> http://localhost:8080/

