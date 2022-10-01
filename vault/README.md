# Vault

You should now be able to create Vault.

## Reference
* [Vault](https://www.vaultproject.io/docs)

## Install the Vault:
### Makefile

```
❯ make help 

 ------------------------------------
 Vault
 ------------------------------------
 make vault - Client Vault
 make install
   - debug=false|true
     ex: make install debug=true
 make delete
```

## Validate

### Check

```
kubectl exec -it pod/vault-0 -n vault -- vault status
```
### Initialize the Vault instance

```
kubectl exec -it pod/vault-0 -n vault -- vault operator init -n 1 -t 1
```

###  Let’s unseal the vault so we can use it

```
kubectl exec -it pod/vault-0 -n vault -- vault operator unseal "unseal"
```

### You will then be able to access Vault in your browser at: https://localhost:8200

```
kubectl port-forward -n vault svc/vault  8080:8200
```