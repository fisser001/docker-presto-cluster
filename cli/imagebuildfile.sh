#!/bin/bash

export version=1.0.0

cd ~/repos/masterarbeit/docker-presto-cluster/cli
docker build -t mfisser/presto-cli:${version} ./
docker push mfisser/presto-cli:${version}