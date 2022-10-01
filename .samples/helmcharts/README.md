# #name#

You should now be able to create #name#.

## Reference
* [#name#]()

## Install the #name#:
### Makefile

```
❯ make help 

 ------------------------------------
 #name#
 ------------------------------------
 make install
   - debug=false|true
     ex: make install debug=true
 make delete
```

## Validate

### Check

```
❯ kubectl get pods,deploy,svc -n #namespace#                                       

```
### Get the #name# server URL by running these commands in the same shell

```
kubectl port-forward -n #namespace# svc/#name#-server 8080:80
```
> http://localhost:8080/

