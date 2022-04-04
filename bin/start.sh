#!/bin/sh

catalina.sh run &
cd northwindAPI
npx nodemon server.js 
