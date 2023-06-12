# Qdrant Vector Database on Azure Cloud

This project provides resources to deploy the Qdrant vector database to Azure using Azure Container Apps.

Azure Container Apps is a serverless platform for running containerized applications without managing infrastructure, providing simplified deployment and scalability.

## Qdrant Vector DB with Volume on Azure

### Features

This project framework provides the following features:

- Ability to deploy the Qdrant vector database using via Azure Container Apps for use in storing AI generated embeddings
- Ability to deploy persistent volume with Azure Container Apps to store/persist Qdrant data
- Ability to create an Azure Storage account and file share for Qdrant data

### Prerequisites

To get started, users will need access to an Azure subscription.
Users will need to have permissions in their Azure subscription for Azure Container Apps and Azure Storage.

If using the **Deploy to Azure button**, you will need an Azure Storage account. When you select the Deploy to Azure button, the template will create a storage account for you.

### Getting Started

You can get started by using the **Deploy the Azure** button shown below.

#### Deployment

These templates demonstrates a simple way to deploy the Qdrant vector database with a volume for [Azure Container Apps](aka.ms/containerapps).  Use the **Deploy to Azure** button below to quickly deploy to your subscription with an Azure Container Apps.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure-Samples%2Fqdrant-azure%2Fmain%2FAzure-Container-Apps%2FARM-templates%2Fqdrant-aca-deploy.json)

> This solution contains _both_ an Azure Bicep and an ARM template.  The **Deploy to Azure** button uses the ARM template.  To use the Bicep template, please follow the instructions below for using the Azure CLI or Azure PowerShell.

##### Alternative deployment techniques

Alternatively, you can deploy the solution using the either the Azure CLI or Azure PowerShell.

###### Azure CLI

Deploy the Azure Container Apps with a new storage account volume created using the Bicep template `main.bicep` located this directory directory.

To deploy using the Azure CLI, open the command line and run the following command:

```shell
  az deployment group create \
  --name ExampleDeployment \
  --resource-group ExampleGroup \
  --template-file main.bicep \
```

###### Azure PowerShell

Deploy the Azure Container Apps with a new storage account volume using the Azure Bicep template `main.bicep` located in this directory.

To deploy using the Azure Powershell, open the Powershell command line and run the following command:

```powershell
   New-AzResourceGroupDeployment `
      -Name remoteTemplateDeployment `
      -ResourceGroupName ExampleGroup `
      -TemplateFile main.bicep
```

###### Validate your deployment
This deployment creates two container apps on a vnet integrated container apps environment.The first application allows users to access the Qdrant APIs via a REST interface, while the second application allows Qdrant access over a gRPC interface. :

1. HTTP Application: To confirm the successful deployment of the HTTP app, execute a Curl command over the root endpoint. This should return the Qdrant version.
   ```bash
   > curl https://<htto-app-endpoint>.<env-name>.<region>.azurecontainerapps.io
   {"title":"qdrant - vector search engine","version":"1.2.2"}
   ```
2. gRPC Application: In order to interact with the gRPC app, you need to clone the Qdrant repository first. Then, use [grpcurl](https://github.com/fullstorydev/grpcurl), a command-line utility to make gRPC requests, to invoke the Qdrant health check endpoint.
   ```bash
   # For detailed instructions, refer: https://github.com/qdrant/qdrant/blob/master/QUICK_START_GRPC.md
   > git clone https://github.com/qdrant/qdrant
   > cd qdrant
   > grpcurl -plaintext -import-path ./lib/api/src/grpc/proto/ -proto qdrant.proto -d '{}' <grpc-app-endpoint>.<env-name>.<region>.azurecontainerapps.io:6334 qdrant.Qdrant/HealthCheck
     {
       "title": "qdrant - vector search engine",
       "version": "1.2.2"
     }
   ``` 


## Resources to learn more

For more information in deploying ARM templates please review:

- [Deploy resources with Bicep and Azure PowerShell](https://learn.microsoft.com/azure/azure-resource-manager/bicep/deploy-powershell)
- [How to deploy resources with Bicep and Azure CLI](https://learn.microsoft.com/azure/azure-resource-manager/bicep/deploy-cli)
- [Deploy resources with ARM templates and Azure PowerShell](https://learn.microsoft.com/azure/azure-resource-manager/templates/deploy-powershell)
- [How to use Azure Resource Manager (ARM) deployment templates with Azure CLI](https://learn.microsoft.com/azure/azure-resource-manager/templates/deploy-cli)
