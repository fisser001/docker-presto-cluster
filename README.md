# Presto benchmarking cluster with Hive and HDFS based on Docker-compose
This repository contains all the container related code for creating the container images and starting the benchmarking cluster.  

All container have been build by Docker and executed by Docker-compose.

All given information/code belong only to Presto which was one tool of the benchmark. Each component of Presto has its own Docker image.

## Subfolder and relevant files

The repository is divided into the following subfolder:

### base
Contains the definition for the creation of an Presto Docker base image.

### coordinator
Definition of the Docker image for the Presto coordinator component. This definition is based on the previous defined base image.

### worker
Definition of the Docker image for the Presto worker component. This definition is based on the previous defined base image.

### cli
Definition of the Docker image for the Presto cli component.

### Docker-compose
This file contains the main definiton of the Presto cluster with additional components like HDFS, Hive, etc. which have been used by the benchmark. The file contains all components that are relevant for starting the benchmark environment.

The Hadoop components which are used within in the Docker-compose file are described in the following repository: https://github.com/fisser001/docker-hadoop

The Hive components which are used within in the Docker-compose file are described in the following repository: https://github.com/fisser001/docker-hive

The Hive Metastore component which is used within in the Docker-compose file is described in the following repository: https://github.com/fisser001/docker-hive-metastore-postgresql

In order to start the cluster, Docker and Docker-compose have to be installed on the machine where the cluster should be started. If that is fullfilled navigate to the folder where the Docker-compose file is located. The following command has to be executed for starting all relevant components:

```console
docker-compose up
```

After execution of the Docker-compose file the following components will start:

1.  Hadoop Namenode (1x)
2.  Hadoop Datanode (3x)
3.  Hadoop Resourcemanager (1x)
4.  Historyserver (1x)
5.  Nodemanager (2x)
6.  Hive-Server (1x)
7.  Hive-Metastore (1x)
8.  Postgres DB for Hive-Metastore (1x)
9.  Presto coordinator (1x)
10. Presto Worker (5x)

In order to shut down all components of the environment the following command needs to be executed:
```console
docker-compose stop
```

## Access to GUIs
Once all containers have been started the GUIs of the components can be accessed by the following URLs within a browser:

- Namenode: http://<docker_IP_address>:50070/dfshealth.html#tab-overview
- History server: http://<docker_IP_address>:8188/applicationhistory
- Datanode: http://<docker_IP_address>:50075/
- Nodemanager: http://<docker_IP_address>:8042/node
- Resource manager: http://<docker_IP_address>:8088/
- coordinator: http://<docker_IP_address>:8080/

In order to find the IP address that has been given to the component one can execute the following commands:
```console
docker network ls #In order to get the network name
docker network inspect <NETWORK NAME> #Exchange the network name with the identified name with the previous command.
```

## Access the container

### Hive
Navigate into the Docker-compose directory and execute the following command:
```console
docker-compose -p benchmark exec hive-server bash
```
Within in this container one can access the hive-server with the following command in order to execute hive queries:
```console
/opt/hive/bin/beeline -u jdbc:hive2://localhost:10000
```

### Presto 
Navigate into the Docker-compose directory and execute the following command. Before executing the command, the NETWORK NAME has to be exchanged with the used name.  Here the cli is entered:
```console
 docker run -it --net=<NETWORK NAME> -ti mfisser/presto-cli:1.0.0
```
Within this container one can access the Presto cli with the following command in order to execute queries:
```console
/usr/local/bin/presto --server coordinator:8080 --catalog hive --schema default
```