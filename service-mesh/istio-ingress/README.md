# istio-ingress

You should now be able to create istio-ingress.

## Reference
* [istio-ingress]()

## Install the istio-ingress:
### Makefile

```
❯ make help 

 ------------------------------------
 istio-ingress
 ------------------------------------
 make install
   - debug=false|true
     ex: make install debug=true
 make delete
```

## Validate

### Check

```
❯ kubectl get pods,deploy,svc -n istio-ingress                                       

```
### Get the istio-ingress server URL by running these commands in the same shell

```
kubectl port-forward -n istio-ingress svc/istio-ingress-server 8080:80
```
> http://localhost:8080/

