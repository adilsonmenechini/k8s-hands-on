# grafana

You should now be able to create grafana.

## Reference
* [grafana]()

## Install the grafana:
### Makefile

```
❯ make help 

 ------------------------------------
 grafana
 ------------------------------------
 make install
   - debug=false|true
     ex: make install debug=true
 make delete
```

## Validate

### Check

```
❯ kubectl get pods,deploy,svc -n monitoring                                       
NAME                                                READY   STATUS    RESTARTS   AGE
pod/grafana-test                                     0/1     Error     0          56m
pod/grafana-74bc8f7b49-ggdhm                         1/1     Running   0          56m

NAME                                            READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/grafana                         1/1     1            1           56m

NAME                                    TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
service/grafana                         ClusterIP   10.43.201.215   <none>        80/TCP     56m
```
### Get the Grafana server URL by running these commands in the same shell

```
kubectl port-forward -n monitoring svc/grafana 8080:80
```
> http://localhost:8080/

