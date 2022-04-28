#!/bin/bash

echo "Building Docker Container..."
docker build -t test .
echo "Done."

echo "Running Docker Container..."
docker stop comp256
docker run --rm -it --name comp256 -p 8080:8080 -p8000:8000 --mount type=bind,source="$(pwd)"/comp256,target=/usr/local/tomcat/webapps/comp256 --mount type=bind,source="$(pwd)"/northwindAPI,target=/usr/local/tomcat/northwindAPI test
