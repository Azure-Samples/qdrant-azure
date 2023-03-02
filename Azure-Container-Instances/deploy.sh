#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

# The short name for the Azure region (az account list-locations --query [].name -o tsv)
LOCATION=eastus

az deployment sub create \
    --location $LOCATION \
    --template-file main.bicep







