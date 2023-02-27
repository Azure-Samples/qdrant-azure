# Qdrant Vector Database on Azure Cloud
Qdrant vector database on Azure using:

- **Azure Container Instance**
- **Azure Kubernetes Service**
- **Qdrant container in DockerHub**
- **Helm (custom chart w/qdrant helm dependency)**

## Project Information
---
description: This project provides resources to deploy the Qdrant Vector database to Azure Kubernetes Service using a Helm Chart
page_type: sample

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
-- Helm: Helm can be installed via package manager or with the Helm script provide in folder `scripts` in this directory. 
-- Kubectl: Tools for Kubernetes will need to installed. 


### Installation

**Azure Kubernetes Sre**

To deploy the Qdrant service on Azure Kubernetes Service with Azure Volume, ensure that a AKS cluster is running.

Then go to the `azure-qdrant` folder and run the following commands:

```bash
helm repo add azure-qdrant <local-folder>
helm install <name of installation> azure-qdrant/azure-qdrant
```
```

## Resources

(Any additional resources or related projects)

- Link to supporting information
- Link to similar sample
- ...
