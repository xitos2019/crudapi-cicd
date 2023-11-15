# Getting Started
This document will provide steps to create AKS cluster Service Principal and CICD pipeline to deploy CRUD API on AKS cluster using GitHub Action.

* We will Create Service Principal first to authenticate AKS cluster with Github action using  below command you need to 
  provide your subscription ID where you want to create Service Principal.
  `az ad sp create-for-rbac --name "sp-aks-dev" --role Owner --scope /subscriptions/your subscription ID --sdk-auth`
  We will set all output after SP creation as secret in Github Actions.
* We have Terraform script ready within Infra directory to create AKS cluster we only need to provide `dev.tfvars` values 
  and apply terraform to create resource group and AKS cluster.
* We will now setup CICD pipeline as code `NewlookTask/.github/workflows/build.yaml` in GitHub Actions. We need to setup follwing GitHub Actions Secrets `(DOCKER_REGISTRY,DOCKER_REGISTRY_USERNAME,DOCKER_REGISTRY_PASSWORD,AZURE_CREDENTIALS)` to create connections between GitHub Actions and Docker Hub also using Service Principal to authenticate GitHub Actions with AKS cluster.   
  Tasks involves in this pipeline are Build application, Build Docker Image and push to Docker Hub Repo and last step is to deploy on AKS cluster.     