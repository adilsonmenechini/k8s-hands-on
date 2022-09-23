# Sealed Secrets

You should now be able to create sealed secrets.

## Install the client-side tool (kubeseal) and Sealed Secrets:
### Makefile
- Client-side
```
make install
```
- Sealed Secrets
```
make download
```
### OR
- Client-side
```
	wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.18.4/kubeseal-0.18.4-linux-amd64.tar.gz
	tar -xvzf kubeseal-0.18.4-linux-amd64.tar.gz kubeseal
	sudo install -m 755 kubeseal /usr/local/bin/kubeseal
	rm -rf kubeseal-0.18.4-linux-amd64.tar.gz kubeseal
	kubeseal --version
```
- Sealed Secrets
```
	helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
	helm repo update
	helm install sealed-secrets --set-string fullnameOverride=sealed-secrets-controller sealed-secrets/sealed-secrets --namespace kube-system
```

## Create a sealed secret file running the command below:
### strict (default)
- Create yaml
```
kubectl create secret generic echo --from-literal=echo="hello world" -n default --dry-run=client -oyaml > echo.yaml
```
- Seal (safe to share publicly)
```
kubeseal < echo.yaml > sealed-echo.yaml
```
- Apply
```
kubectl apply -f sealed-echo.yaml
```
### namespace-wide

- Generate base64 secret
```
echo "my secret" | base64   
bXkgc2VjcmV0Cg==
```
- Create yaml
```
cat <<EOF > example-annotations-nsw.yaml
apiVersion: v1
kind: Secret
metadata:
  name: example-annotations-nsw
  namespace: default
  annotations:
    sealedsecrets.bitnami.com/namespace-wide: "true"
type: Opaque
data:
    secret: bXkgc2VjcmV0Cg==
EOF
```
- Seal (safe to share publicly)
```
kubeseal < example-annotations-nsw.yaml > sealed-example-annotations-nsw.yaml
```
- Apply
```
kubectl apply -f sealed-example-annotations-nsw.yaml
```
### cluster-wide:
- Create yaml
```
cat <<EOF > example-annotations-cw.yaml
apiVersion: v1
kind: Secret
metadata:
  name: example-annotations-cw
  namespace: default
  annotations:
    sealedsecrets.bitnami.com/cluster-wide: "true"
type: Opaque
data:
    secret: bXkgc2VjcmV0Cg==
EOF
```
- Seal (safe to share publicly)
```
kubeseal < example-annotations-cw.yaml > sealed-example-annotations-cw.yaml
```
- Apply
```
kubectl apply -f sealed-example-annotations-cw.yaml
```
### Public key
- Request 
```
kubeseal --fetch-cert > public-key-cert.pem
```
- Seal
```
kubeseal --format yaml --cert=public-key-cert.pem < secret.yaml > sealed-mysecret.yaml
```
- Apply
```
kubectl apply -f sealed-mysecret.yaml
```
## View Sealed Secrets
```
kubectl get sealedsecrets
```

## Logs
```
kubectl logs -f -n kube-system deploy/sealed-secrets-controller

kubectl logs --tail=10 -n kube-system deploy/sealed-secrets-controller
```