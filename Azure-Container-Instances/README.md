# Qdrant Vector Database on Azure Cloud

Qdrant vector database on Azure using Azure Container Instance.

This project provides resources to deploy the Qdrant Vector database to Azure using Azure Container Instances.

## Qdrant Vector DB with Volume on Azure

### Features

This project framework provides the following features:

- Ability to deploy the Qdrant vector database using via Azure Container Instances for use in storing AI generated embeddings
- Ability to deploy persistent volume with Azure Container Instances to store/persist Qdrant data
- Ability to create a storage account and file share for Qdrant data

### Getting Started

You can get started by using the Deploy the Azure button shown above or by going to the service folder for each Qdrant deployment option shown above.

### Prerequisites

To get started, users will need access to an Azure subscription.
Users will need to have permissions in their Azure subscription to for Azure Container Instances and Azure Storage.

If using the **Deploy to Azure button**, you will need a storage account set up in Azure. When you select the Deploy to Azure button, the template will **create** a storage account for you.

### Installation

#### Azure Container Instances

##### Deployment

These templates demonstrates a simple way to deploy the Qdrant vector database with a volume for [Azure Container Instances](https://docs.microsoft.com/azure/container-instances/).

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure-Samples%2Fqdrant-azure%2Fmain%2FAzure-Container-Instances%2FARM-templates%2Fqdrant-deploy-aci-linkedstorage-params.json)

Option 1: Click on Deploy to Azure button above to quickly deploy to your subscription with an Azure Container Instance. Please ensure that you have reviewed the prerequisites and installation steps above.

Option 2: You can also deploy using the Azure CLI.

Deploy the Azure Container Instance with a new storage account volume created using the ARM template `qdrant-deploy-aci-linkedstorage-params.json` located in the [`ARM-templates`](./ARM-templates) directory.

To deploy using the Azure CLI, open the command line and run the following command:

```azurecli
  az deployment group create \
  --name ExampleDeployment \
  --resource-group ExampleGroup \
  --template-uri azuredeploy.json \
```

Example of raw Github link: <https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/quickstarts/microsoft.storage/storage-account-create/azuredeploy.json>

Option 3: You can also deploy using the Azure Powershell.

Deploy the Azure Container Instance with a new storage account volume using the ARM template `qdrant-deploy-aci-linkedstorage.json` located in the [`ARM-templates`](./ARM-templates) directory.

To deploy using the Azure Powershell, open the Powershell command line and run the following command:

```powershell
   New-AzResourceGroupDeployment `
      -Name remoteTemplateDeployment `
      -ResourceGroupName ExampleGroup `
      -TemplateUri azuredeploy.json
```
  
Example of format of raw Github link: <https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/quickstarts/microsoft.storage/storage-account-create/azuredeploy.json>

## Resources

For more information in Deploying ARM templates please review:

- [Deploy resources with ARM templates and Azure PowerShell](https://learn.microsoft.com/azure/azure-resource-manager/templates/deploy-powershell)
- [How to use Azure Resource Manager (ARM) deployment templates with Azure CLI](https://learn.microsoft.com/azure/azure-resource-manager/templates/deploy-cli)
