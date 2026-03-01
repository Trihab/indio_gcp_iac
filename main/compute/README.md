## Compute Deployment

I deployed a GKE Autopilot cluster to host my ArgoCD. It will allow me to easily manage my two on-premise kubernetes clusters.

### Cluster Management

To manage my GKE cluster using kubectl, I had to create the config file associated to my cluster. I can get the required informations by using gcloud cli using this command:
```bash
gcloud container clusters get-credentials [CLUSTER-NAME] --region=[REGION] --project=[PROJECT]
```
It will automatically create and populate your kubeconfig with the needed informations. In order to check if it worked you can run : `kubectl config view`. You should find information about your GKE cluster as context and config.

### Cost

A GKE Autopilot cluster is cost-effective because you are charged only for the resources you use and not for the number of nodes you have. It means that if you set resources quotas on your kubernetes apps you can limit your bill.
