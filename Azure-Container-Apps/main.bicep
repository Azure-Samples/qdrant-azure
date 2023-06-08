targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string = 'eastus'

@description('Name used for resource group and to generate a unique string for deployed resources.')
param environmentName string = ''

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${environmentName}-rg'
  location: location
}

module qdrant 'resources.bicep' = {
  name: 'qdrant-deploy'
  scope: rg
  params: {
    location: location
    environmentName: environmentName
  }
}
