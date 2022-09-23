# Prometheus

You should now be able to create Prometheus.

## Reference
* [Prometheus](https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus)

## Install the Prometheus:
### Makefile

```
❯ make help 

 ------------------------------------
 Prometheus
 ------------------------------------
 make install 
 make delete
```

## Validate

### Check

```
❯ kubectl get pods,deploy,svc -n monitoring                                       
NAME                                                READY   STATUS    RESTARTS   AGE
pod/prometheus-node-exporter-xvkjp                  1/1     Running   0          84m
pod/prometheus-node-exporter-wsthf                  1/1     Running   0          84m
pod/prometheus-node-exporter-pcvzq                  1/1     Running   0          84m
pod/prometheus-kube-state-metrics-76fb587f4-w6mj2   1/1     Running   0          84m
pod/prometheus-pushgateway-6f6f965999-45btf         1/1     Running   0          84m
pod/prometheus-server-5f6ff68dcc-zprz4              2/2     Running   0          84m
pod/prometheus-alertmanager-5ccbb5dd87-zqml4        2/2     Running   0          84m

NAME                                            READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/prometheus-kube-state-metrics   1/1     1            1           84m
deployment.apps/prometheus-pushgateway          1/1     1            1           84m
deployment.apps/prometheus-server               1/1     1            1           84m
deployment.apps/prometheus-alertmanager         1/1     1            1           84m

NAME                                    TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
service/prometheus-alertmanager         ClusterIP   10.43.216.142   <none>        80/TCP     84m
service/prometheus-kube-state-metrics   ClusterIP   10.43.87.37     <none>        8080/TCP   84m
service/prometheus-node-exporter        ClusterIP   None            <none>        9100/TCP   84m
service/prometheus-pushgateway          ClusterIP   10.43.46.51     <none>        9091/TCP   84m
service/prometheus-server               ClusterIP   10.43.4.12      <none>        80/TCP     84m
```
### Get the Prometheus server URL by running these commands in the same shell

```
kubectl port-forward -n monitoring svc/prometheus-server 8080:80
```
> http://localhost:8080/

