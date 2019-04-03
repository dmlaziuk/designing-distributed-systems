#!/bin/bash

if ! which kubectl; then
  echo "Can't find kubectl, please install it."
  exit 1
fi

for x in 0 1 2; do
  kubectl exec testclient -- \
    ./bin/kafka-topics.sh \
      --create \
      --zookeeper kafka-service-zookeeper:2181 \
      --replication-factor 3
      --partitions 10
      --topic photos-$x
done
