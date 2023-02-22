# Qdrant Vector Database on Azure Cloud
Qdrant vector database on Azure using:

- **Azure Container Instance**
- **Azure Kubernetes Service**
- **Qdrant container in Docker Desktop**
- **Helm (custom chart w/qdrant helm dependency)**

## Project Information
---
Description: This project provides resources to deploy the Qdrant Vector database to Azure using Azure Container Instances and/or Azure Kubernetes Service via ARM template, bicep, or Helm Chart.
page_type: sample

Products:
- azure
- azure-resource-manager
- azure-container-instance
- azure-kubernetes-service
- qdrant vector database (oss)

languages:
- json
- yaml
- sh
---

# Qdrant Vector DB with Volume on Azure 

[![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure-Samples%2Fqdrant-azure%2Fdev-aci%2Faz-acideploy-armtemplates%2FazContainerInstances%2Faci-qdrant-arm-voldeploy.json)

## Features
This project framework provides the following features:

* Ability to deploy the Qdrant vector database using via Azure Container Instances for use in storing AI generated embeddings
* Ability to deploy persistent volume with Azure Container Instances to store/persist Qdrant data


## Getting Started
You can get started by using the Deploy the Azure button shown above or by going to the service folder for each Qdrant deployment option shown above. 

### Prerequisites

To get started, users will need access to an Azure subscription.

### Installation

**Azure Container Instances**
![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/)

**Azure Kubernetes Service**

**Docker (Local)**

**Kubernetes (Local)**
- ...

### Quickstart


1. Click on Deploy to Azure button above to quickly deploy to your subscription with an Azure Container Instance


## Deployment

These templates demonstrates a simple way to deploy the Qdrant vector database with a volume for [Azure Container Instances](https://docs.microsoft.com/azure/container-instances/).

## Resources

(Any additional resources or related projects)

- Link to supporting information
- Link to similar sample
- ...
