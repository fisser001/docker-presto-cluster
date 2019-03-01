#!/bin/bash

export version=1.0.0

cd ~/repos/masterarbeit/docker-presto-cluster/base
docker build -t mfisser/presto-base:${version} ./
docker push mfisser/presto-base:${version}

cd ~/repos/masterarbeit/docker-presto-cluster/coordinator
docker build -t mfisser/presto-coordinator:${version} ./
docker push mfisser/presto-coordinator:${version}

cd ~/repos/masterarbeit/docker-presto-cluster/worker
docker build -t mfisser/presto-worker:${version} ./
docker push mfisser/presto-worker:${version}

cd ~/repos/masterarbeit/docker-presto-cluster/cli
docker build -t mfisser/presto-cli:${version} ./
docker push mfisser/presto-cli:${version}