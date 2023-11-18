# Getting Started
This document will provide steps to create AKS cluster, Service Principal and CICD pipeline to deploy CRUD API on AKS cluster using GitHub Action build and deploy pipeline.

* First of all we will create Service Principal authenticate AKS cluster with Github action by running below command.
  provide your subscription ID where you want to create Service Principal.

  `az ad sp create-for-rbac --name "sp-aks-dev" --role contributor --scope /subscriptions/mysubscription --sdk-auth`

Out put from above command which we will use as Azure Credentials secret in Github action.
```
{
  "clientId": "myclient ID",
  "clientSecret": "my client secret",
  "subscriptionId": "my subscription ID",
  "tenantId": "my tenant ID"
}
``` 
 * For Docker Image i have used [Dockerhub](https://hub.docker.com/repository/docker/fais786/crudapitest/general) registery where we will push docker images and deploy on AKS cluster.

* To spin up AKS cluster and underlaying resources run below terraform command.
  
  `.\terraform.exe apply -var-file .\dev.tfvars`

* In GitHub Action we will creat repository secrets and  enviornment variables Navigate to
  
       **Github Repository-->Settings-->Secrets and Variables-->Actions**
  
and create below secrets to authenticate DockerHub Registery and Azure with Github Action  and enviornment variable.

  **Secrets** 

* DOCKER_REGISTRY (Docker hub registery name)
* DOCKER_REGISTRY_USERNAME (DockerHub Registery UserName)
* DOCKER_REGISTRY_PASSWORD (DockerHub Registery Access Token)
* AZURE_CREDENTIALS (Output from Service Principle creation )

**Enviornment Variable**

* CLUSTER_NAME (AKS Cluster Name)
* RESOURCE_GROUP (Resource Group)

**CICD Pipeline** 

I have created GITHUB Action CICD pipeline as yaml and configured 3 tasks.

* Build Dependencies 
* Build and push Docker image
* Deploy onto AKS cluster


