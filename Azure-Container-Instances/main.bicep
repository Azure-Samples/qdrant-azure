targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string = 'eastus'

@description('Name used for resource group and to generate a unique string for deployed resources.')
param environmentName string = 'qdrantazure'

var abbrs = loadJsonContent('abbreviations.json')
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${abbrs.resourcesResourceGroups}${environmentName}'
  location: location
}

module qdrant 'resources.bicep' = {
  name: 'qdrant-deploy'
  scope: rg
  params: {
    location: location
    resourceToken: resourceToken
    containerName: environmentName
  }
}
