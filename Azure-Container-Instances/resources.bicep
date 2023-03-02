param name string
param location string
param resourceToken string
param containerVolumeMountName string = 'azqdrantvolume'
param storageFileShareName string = 'aciqdrantshare'
param imageName string = 'qdrant/qdrant:latest'
param containerMemoryGB int = 16
param containerCpuCore int = 4
// param storageShareName string = 'qdrant-share'

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
  name: '${abbrs.containerInstanceContainerGroups}${name}${resourceToken}'
  location: location
  properties: {
    sku: 'Standard'
    containers: [
      {
        name: name
        properties: {
          image: imageName
          ports: [
            {
              port: 80
              protocol: 'TCP'
            }
            {
              port: 633
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
          port: 633
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
