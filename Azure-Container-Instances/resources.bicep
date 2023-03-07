@description('Azure region for provisioned resources.')
param location string = resourceGroup().location

@description('Suffix for provisioned Azure resources.')
param resourceToken string

@description('Name of the ACI container volumn.')
param containerVolumeMountName string = 'azqdrantvolume'

@description('Name of the Azure Storage file share to be created.')
param storageFileShareName string = 'aciqdrantshare'

@description('Name of the image to be pulled from Docker Hub.')
param imageName string = 'qdrant/qdrant:latest'

@description('Memory (in GB) of the container.')
param containerMemoryGB int = 16

@description('CPU cores of the container.')
param containerCpuCore int = 4

@description('Name of the container.')
param containerName string

var abbrs = loadJsonContent('abbreviations.json')

resource storage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: '${abbrs.storageStorageAccounts}${resourceToken}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    supportsHttpsTrafficOnly: true
  }

  resource fileservices 'fileServices' = {
    name: 'default'

    resource share 'shares' = {
      name: storageFileShareName
    }
  }
}

resource aci 'Microsoft.ContainerInstance/containerGroups@2022-10-01-preview' = {
  name: '${abbrs.containerInstanceContainerGroups}${resourceToken}'
  location: location
  properties: {
    sku: 'Standard'
    containers: [
      {
        name: containerName
        properties: {
          image: imageName
          ports: [
            {
              port: 80
              protocol: 'TCP'
            }
            {
              port: 6333
              protocol: 'TCP'
            }
          ]
          resources: {
            requests: {
              cpu: containerCpuCore
              memoryInGB: containerMemoryGB
            }
          }
          volumeMounts: [
            {
              name: containerVolumeMountName
              mountPath: '/qdrant/storage'
            }
          ]
        }
      }
    ]
    osType: 'Linux'
    restartPolicy: 'OnFailure'
    ipAddress: {
      ports: [
        {
          port: 80
          protocol: 'TCP'
        }
        {
          port: 6333
          protocol: 'TCP'
        }
      ]
      type: 'Public'
      dnsNameLabel: 'qdrant-aci-dns'
    }
    volumes: [
      {
        name: containerVolumeMountName
        azureFile: {
          shareName: storageFileShareName
          storageAccountName: storage.name
          storageAccountKey: storage.listKeys().keys[0].value
        }
      }
    ]
  }
}
