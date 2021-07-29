#!/bin/bash
K6IMAGE=quay.io/agustinlare/k6ocp
docker build -t $K6IMAGE .
docker push $K6IMAGE