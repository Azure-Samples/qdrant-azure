#!/bin/bash

set -o errexit
#set -o pipefail
set -o nounset

LOCATION=eastus
#DEPLOYMENT_NAME=acaqdrant$(date +%m%d%H%M%S)
DEPLOYMENT_NAME=acaqdrant

az deployment sub create \
    --name $DEPLOYMENT_NAME \
    --location $LOCATION \
    --template-file main.bicep \
    --parameters location=$LOCATION \
    --parameters environmentName=$DEPLOYMENT_NAME

