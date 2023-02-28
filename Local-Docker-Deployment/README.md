# Qdrant Vector Database on Azure Cloud
Install Qdrant vector database on Azure using:

**Qdrant container in Docker Desktop**

## Project Information
---
Description: This provides resources to deploy the Qdrant Vector database to Docker on your local desktop using Docker Desktop and PostgreSQL.
page_type: sample

Products:
- docker
- qdrant vector database (oss)

languages:
- json
- yaml
---

# Qdrant Vector DB on Docker Desktop

## Software dependencies
- **Docker engine**
- **Qdrant vector search engine** 

## Installation

Install the following software on your machine:
- Install the [Docker engine](https://docs.docker.com/engine/install). 
Note: Docker is used to run [Qdrant](https://qdrant.tech) vector search engine. To persist data, you will need to configure storage (volume) or store your data. You can read more about this in the [Docker Storage documentation](https://docs.docker.com/storage/).


## Start Docker engine

Ensure that the Docker engine service is running on your computer. Docker can be configured to run automatically when your computer starts. This is the recommended setup.  

[Docker auto start](../img/docker-autostart.png)

## Configure Docker

To configure docker services for Qdrant Docker, please follow the instructions below.

**Docker (Local)**

To run the Qdrant vector database running in Docker locally, please follow the instructions from Qdrant's website: 
[Install Qdrant with Docker](https://qdrant.tech/documentation/install/#with-docker)

To run Qdrant with Docker locally, you can use the following command using  default values stored in the file .config/config.yaml located in the Local Docker folder. 

```bash
docker run -p 6333:6333 \
    -v $(pwd)/path/to/data:/qdrant/storage \
    -v $(pwd)/path/to/custom_config.yaml:/qdrant/config/production.yaml \
    qdrant/qdrant
```
You can overwrite values by creating and adding new records to a file ./config/production.yaml. An example of the production.yaml file located in the Local-Docker directory. Please review the [Qdrant documentation](https://qdrant.tech/documentation/install/#configuration) to learn more information on configuration options.


