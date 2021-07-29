# K6 Stress test

k6 is a modern load testing tool. This Dockerbuild has been modified to work on an Openshift cluster

## Configuration
On the `./single-request.js` file Line 19 insert the url for the requests and on Line 10 you can espcify the requests and the duration

## Usage
The env K6_TARGEt_ENDPOINT is the value that its gonna target

## Build 
./build.sh
