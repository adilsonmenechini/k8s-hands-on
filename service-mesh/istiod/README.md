# istiod

You should now be able to create istiod.

## Reference
* [istiod]()

## Install the istiod:
### Makefile

```
❯ make help 

 ------------------------------------
 istiod
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
### Get the istiod server URL by running these commands in the same shell

```
kubectl port-forward -n istio-system svc/istiod-server 8080:80
```
> http://localhost:8080/

