#!/bin/bash
K6IMAGE=quay.io/agustinlare/k6
docker build -t $K6IMAGE .
docker push $K6IMAGE