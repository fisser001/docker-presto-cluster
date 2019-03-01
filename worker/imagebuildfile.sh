#!/bin/bash

export version=1.0.0

cd ~/repos/masterarbeit/docker-presto-cluster/worker
docker build -t mfisser/presto-worker:${version} ./
docker push mfisser/presto-worker:${version}