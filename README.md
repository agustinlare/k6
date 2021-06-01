# K6 Stress test

k6 is a modern load testing tool. This Dockerbuild has been modified to work on an Openshift cluster

## Configuration
On the `./single-request.js` file Line 19 insert the url for the requests and on Line 10 you can espcify the requests and the duration

# Build & push
```=bash
K6IMAGE=quay.io/agustinlare/k6ocp
docker build -t $K6IMAGE .
docker push $K6IMAGE
```
