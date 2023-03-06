#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

# The short name for the Azure region (az account list-locations --query [].name -o tsv)
LOCATION=northcentralus
DEPLOYMENT_NAME=qdrant-sample-deploy-$(date +%Y%m%d_%H%M%S)

az deployment sub create \
    --name $DEPLOYMENT_NAME \
    --location $LOCATION \
    --template-file main.bicep \
    --parameters location=$LOCATION







