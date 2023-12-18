This is an extension based on https://github.com/antonputra work

## EKS Cluster using Terraform MODULES (AWS Load Balancer Controller + Autoscaler + IRSA + CastAI + Rancher)

## To deploy:

cd terraform/
terraform int  
terraform plan  
terraform apply  
cd ..

aws eks update-kubeconfig --region ap-northeast-2 --name cluster2

## CastAI

curl -H "Authorization: Token XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" "https://api.cast.ai/v1/agent.yaml?provider=eks" | kubectl apply -f -

https://console.cast.ai/dashboard

## Rancher

scripts/helm-rancher-gen-cert.sh

kubectl apply -f k8s/arn-service-4rancher.yaml



![Edit_record_Rancher](./assets/Edit_record_Rancher.png)

https://rancher.your_domain_name.com/dashboard/



# Architecture Diagram

![Diagram](./assets/architecture_diagram.png)

You can find tutorial [here](https://antonputra.com/amazon/create-eks-cluster-using-terraform-modules/).

![Ingress](./assets/Ingress.jpeg)

![LB](./assets/LB.jpeg)

![NodePort](./assets/NodePort.jpeg)
