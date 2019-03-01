#!/bin/bash

export version=1.0.0

cd ~/repos/masterarbeit/docker-presto-cluster/base
docker build -t mfisser/presto-base:${version} ./
docker push mfisser/presto-base:${version}