# azdev-project-3

## Run locally


```
kubectl config use-context docker-desktop

kubectl apply -f ./kubernetes/
```

Browse to http://localhost:8021


## Deploy to Azure test environment

Creates a 2-node AKS cluster with all components running in the cluster:

```
cd scripts

./deploy-test.ps1
```

Find the public IP address of the Service:

```
kubectl get svc -n todotest 
```

## Deploy to Production

Creates a 3-node AKS cluster with external SQL Server and Table storage:

```
cd scripts

./deploy-prod.ps1
```

Find the public IP address of the Service:

```
kubectl get svc -n todoprod
```