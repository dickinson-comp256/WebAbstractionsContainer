#!/bin/bash

echo "Building Docker Container..."
docker build -t test .
echo "Done."

echo "Running Docker Container..."
docker run --rm -it -p 8080:8080 -p8000:8000 --mount type=bind,source="$(pwd)"/webapp,target=/usr/local/tomcat/webapps/webapp --mount type=bind,source="$(pwd)"/northwindAPI,target=/usr/local/tomcat/northwindAPI test
