#!/bin/bash

echo "Waiting for Kafka to be ready..."
cub kafka-ready -b kafka:29092 1 20

# Create DLQ topic
kafka-topics --create \
  --bootstrap-server kafka:29092 \
  --replication-factor 1 \
  --partitions 3 \
  --topic aether.tasks.dlq \
  --if-not-exists

echo "Topics created successfully"
kafka-topics --list --bootstrap-server kafka:29092