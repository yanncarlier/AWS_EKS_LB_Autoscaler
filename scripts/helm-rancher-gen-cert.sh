#!/usr/bin/bash


# add k8 config
aws eks update-kubeconfig --region ap-northeast-2 --name cluster2  

# https://ranchermanager.docs.rancher.com/v2.6/pages-for-subheaders/install-upgrade-on-a-kubernetes-cluster#install-the-rancher-helm-chart  

helm repo add rancher-stable https://releases.rancher.com/server-charts/stable
kubectl create namespace cattle-system  


# 4. Install cert-manager

# If you have installed the CRDs manually instead of with the `--set installCRDs=true` option added to your Helm install command, you should upgrade your CRD resources before upgrading the Helm chart:
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.7.1/cert-manager.crds.yaml

# Add the Jetstack Helm repository
helm repo add jetstack https://charts.jetstack.io

# Update your local Helm chart repository cache
helm repo update

# Install the cert-manager Helm chart
helm install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.7.1

# to verify  
kubectl get pods --namespace cert-manager


# deply Rancher
helm install rancher rancher-stable/rancher \
  --namespace cattle-system \
  --set hostname=rancher.your_domain_name.com \
  --set bootstrapPassword=admin \


# 6. Verify that the Rancher Server is Successfully Deployed
kubectl -n cattle-system rollout status deploy/rancher

kubectl -n cattle-system get deploy rancher

# to reset the password
# kubectl -n cattle-system exec $(kubectl  -n cattle-system get pods -l app=rancher | grep '1/1' | head -1 | awk '{ print $1 }') -- reset-password  

# If this is the first time you installed Rancher, get started by running this command and clicking the URL it generates:
# echo https://rancher.your_domain_name.com/dashboard/?setup=$(kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{.data.bootstrapPassword|base64decode}}')

# To get just the bootstrap password on its own, run:
# kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{.data.bootstrapPassword|base64decode}}{{ "\n" }}'

# helm uninstall rancher rancher-stable/rancher --namespace cattle-system
