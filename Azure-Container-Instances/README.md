# Qdrant Vector Database on Azure Cloud
Create a Qdrant vector database on Azure using:
- **The Azure Container Instance**

## Getting Started
You can get started by using the Deploy to Azure button shown below or by going to the service folder for
each Qdrant deployment option.

### Prerequisites

To get started, users will need access to an Azure subscription. 
Users will need to have permissions in their Azure subscription to for Azure Container
Instances and Azure Storage.

If using the **Deploy to Azure button**, you will need a storage account set up in Azure. When you select the Deploy to Azure button, the template will **create** a storage account for you. 

### Installation

**Azure Container Instances**

## Deployment

These templates demonstrates a simple way to deploy the Qdrant vector database with a volume for [Azure Container Instances](https://docs.microsoft.com/azure/container-instances/).

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure-Samples%2Fqdrant-azure%2Fmain%2FAzure-Container-Instances%2FARM-templates%2Fqdrant-deploy-aci-linkedstorage-params.json)

Option 1: Click on Deploy to Azure button above to quickly deploy to your subscription with an Azure Container Instance. Please ensure that you have reviewed the prerequisites and installation steps above.

Option 2: You can also deploy using the Azure CLI.

Deploy the Azure Container Instance with a new storage account volume created using the ARM template `qdrant-deploy-aci-linkedstorage-params.json` located in the [`ARM-templates`](./ARM-templates) directory.

To deploy using the Azure CLI, open the command line and run the following command: 
  ```
  az deployment group create \
  --name ExampleDeployment \
  --resource-group ExampleGroup \
  --template-uri<Insert-the Github raw link for template you wish to run> \
  ```
  
Example of raw Github link: https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/quickstarts/microsoft.storage/storage-account-create/azuredeploy.json

Option 3: You can also deploy using the Azure Powershell.

Deploy the Azure Container Instance with a new storage account volume using the ARM template `qdrant-deploy-aci-linkedstorage.json` located in the [`ARM-templates`](./ARM-templates) directory.

To deploy using the Azure Powershell, open the Powershell command line and run the following command:
``` 
   New-AzResourceGroupDeployment `
  -Name remoteTemplateDeployment `
  -ResourceGroupName ExampleGroup `
  -TemplateUri <Insert-the Github raw link for template you wish to run> 
```
  
Example of format of raw Github link: https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/quickstarts/microsoft.storage/storage-account-create/azuredeploy.json

## Resources to Learn More

For more information in Deploying ARM templates please review: 

- [Deploy resources with ARM templates and Azure PowerShell](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-powershell)
- [How to use Azure Resource Manager (ARM) deployment templates with Azure CLI](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-cli)
