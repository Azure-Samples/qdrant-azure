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
Note: Docker is used to run [Qdrant](https://qdrant.tech) vector search engine. 


## Start Docker engine

Ensure that the Docker engine service is running on your computer. Docker can be configured to run automatically when your computer starts. This is the recommended setup.  

![Docker auto start](../img/docker-autostart.png)

## Configure Docker

To configure docker services for Qdrant Docker, please follow the instructions below.

### Step 1: Locate and rename yaml file for Operating System
In this folder `Local-Docker-Deployment` you will find `docker-compose` yaml files for Windows and Mac operating systems. Select the file that is appropriate for your operating system, and create a copy of it. Rename the copied yaml file `docker-compose.yaml`

- Windows: `example-windows-docker-compose.yaml`
- Mac: `example-mac-docker-compose.yaml`

### Step 2: Update Docker Compose file
Open the newly renamed file, `docker-compose.yaml`, with the text editor of your choice.

Adjust the volumes to point to your data directory (see previous note about My Data).
For instance, if you want to store your data  in `D:\QdrantDocker\MyData`, replace

    - d:\workspace\mydata\qdrant:/qdrant/storage

with

    - D:\QdrantDocker\MyData\qdrant:/qdrant/storage

Be sure to keep the file indentation the same in order for the configuration file to run successfully.

### Step 3: Start Docker services

**For Windows:** 
Go to folder where you cloned the repo.  Open a command line and run the the following commands: 
    cd Local-Docker-Deployment
    start.cmd

**For Mac:**
Go to folder where you cloned the repo. Open a terminal and run the following commands: 
    cd Local-Docker-Deployment
    start.sh

![Docker start](./img/docker-start.png)
