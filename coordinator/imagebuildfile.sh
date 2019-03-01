#!/bin/bash

export version=1.0.0

cd ~/repos/masterarbeit/docker-presto-cluster/coordinator
docker build -t mfisser/presto-coordinator:${version} ./
docker push mfisser/presto-coordinator:${version}