# Qdrant Vector Database on Azure Cloud
Qdrant vector database on Azure using:

- **Azure Kubernetes Service**
- **Helm (custom chart w/qdrant helm dependency)**

## Project Information
---
This project provides resources to deploy the Qdrant Vector database to Azure Kubernetes Service using a Helm Chart


# Qdrant Vector DB with Volume on Azure 

## Features
This project framework provides the following features:

* Ability to run a scalable Qdrant cluster on Kubernetes with Azure Kubernetes Service.
* Ability to deploy the Qdrant vector database using via Azure Kubernetes Service via Helm for use in storing AI generated embeddings 
* Ability to deploy persistent volume with Azure Kubernetes Service to store/persist Qdrant data
* Ability to run Qdrant on local desktop with Docker with Kubernetes enabled using Helm.

## Getting Started

### Prerequisites

* To get started, users will need access to an Azure subscription.
* Users will also need to have the following installed on their local machine:

  -- **Helm:** 
  Helm can be installed via package manager or with the Helm script provided in folder `scripts` in this directory. 

  -- **Kubectl:** 
  Tools for Kubernetes will need to installed. You install kubectl using the Azure CLI by executing the command. 

```bash
az aks install-cli
```
Alternative kubectl installation: Following the instructions in the Kubernetes documentation noted here: https://kubernetes.io/docs/tasks/tools/#kubectl As a convenience, a kubectl install script is provided in the `scripts` folder in this directory.

### Installation

**Azure Kubernetes Service**

To deploy the **Qdrant** service on **Azure Kubernetes Service** with Azure Volume, you must first ensure that a AKS cluster is running. You can create a cluster using the Deploy to Azure button below, or manually using the Azure Portal or Azure CLI.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure-Samples%2Fqdrant-azure%2Fmain%2FAzure-Kubernetes-Svc%2Faks-arm-deploy.json)

After the AKS cluster has been created, you can deploy Qdrant on Azure Kubernetes Service with Helm. Go to the `qdrant-on-azure` folder which contains the Helm chart for Qdrant and run the following commands:

**Step 1:** Configure kubectl to connect to your Kubernetes cluster using the `az aks get-credentials` command:

```bash
az aks get-credentials --resource-group <your-resource-group-name> --name <your-aks-cluster-name>
kubectl get nodes
```
**Step 2:** Install Qdrant on Azure Kubernetes Service with Helm by running the following command in the `qdrant-on-azure` folder:

```bash
 helm install <your-release-name> qdrant-on-azure --namespace azqrant --create-namespace
```

## Resources

- Azure Kubernetes Service: https://learn.microsoft.com/en-us/azure/aks/
- Azure Kubernetes Service with Helm: https://learn.microsoft.com/en-us/azure/aks/quickstart-helm
- Qdrant Installation with Kubernetes: https://qdrant.tech/documentation/install/#with-kubernetes
- Qdrant integration with OpenAI: https://qdrant.tech/documentation/integrations/#openai
