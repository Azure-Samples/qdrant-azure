# Qdrant Vector Database on Azure Cloud

This project provides resources to deploy the Qdrant vector database on Azure using Azure Kubernetes Service (AKS) with Helm (custom chart w/qdrant helm dependency).

## Prerequisites

To get started, users will need access to an Azure subscription.
Users will also need to have the following installed on their local machine:

- **Helm:**
  Helm can be installed via package manager or with the Helm script provided in folder `scripts` in this directory.

- **Kubectl:**
  Tools for Kubernetes will need to installed. You install kubectl using the Azure CLI by executing the `az aks install-cli` command.  Alternatively, following the instruction in the [Kubernetes documentation](https://kubernetes.io/docs/tasks/tools/#kubectl) to install kubectl.

As a convenience, a kubectl install script is provided in the `scripts` folder in this directory.

If using the Visual Studio Code dev container, both Helm and Kubectl are installed as features of the dev container.

### Getting Started

You can get started by using the **Deploy the Azure** button shown below.

#### Deployment

To deploy the Qdrant service on Azure Kubernetes Service with an Azure volume, you must first ensure that the AKS cluster is running. You can create a cluster using the **Deploy to Azure** button below, or manually using the Azure Portal or Azure CLI.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure-Samples%2Fqdrant-azure%2Fmain%2FAzure-Kubernetes-Svc%2Faks-arm-deploy.json)

To create an AKS cluster, you will need to provide an SSH public key.  A key can be generated using the `ssh-keygen` command, as shown in the example below.

```bash
ssh-keygen -t rsa -b 4096
```

When prompted, provide the following values:

- **Linux admin username**: Enter a username to connect using SSH, such as _azurek8sadmin_.
- **SSH RSA public key**: copy and paste the _public_ part of your SSH key pair (by default, the contents of _~/.ssh/id_rsa.pub_).

##### Azure CLI

To create an AKS cluster using the Azure CLI, open the command line and run the following command:

```bash
  az deployment group create \
  --name ExampleDeployment \
  --resource-group ExampleGroup \
  --template-file main.bicep \
```

##### Azure PowerShell

To deploy using the Azure Powershell, open the Powershell command line and run the following command:

```powershell
   New-AzResourceGroupDeployment `
      -Name remoteTemplateDeployment `
      -ResourceGroupName ExampleGroup `
      -TemplateFile main.bicep
```

#### Installation

After the AKS cluster has been created, you can deploy Qdrant on Azure Kubernetes Service with Helm. Go to the **qdrant-on-azure** folder which contains the Helm chart for Qdrant and run the following commands:

1. Configure kubectl to connect to your Kubernetes cluster using the `az aks get-credentials` command:

```bash
az aks get-credentials --resource-group <your-resource-group-name> --name <your-aks-cluster-name>
kubectl get nodes
```

<!-- 1. Install the Helm package.

```bash
helm repo add qdrant-on-azure ./Azure-Kubernetes-Svc/qdrant-on-azure/
``` -->

1. From the Azure-Kubernetes-Svc directory, install Qdrant on Azure Kubernetes Service with Helm by running the following command:

```bash
 helm install <your installation name> ./qdrant-on-azure/ --create-namespace
```

## Resources to Learn More

- Azure Kubernetes Service: <https://learn.microsoft.com/azure/aks/>
- Azure Kubernetes Service with Helm: <https://learn.microsoft.com/azure/aks/quickstart-helm>
- Qdrant Installation with Kubernetes: <https://qdrant.tech/documentation/install/#with-kubernetes>
- Qdrant integration with OpenAI: <https://qdrant.tech/documentation/integrations/#openai>
