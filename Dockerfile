FROM tomcat:9.0.20-jre8-alpine

RUN apk update
RUN apk upgrade

# Setup the SQLite and the Northwind sample database
RUN apk add sqlite sqlite-dev
ADD ./northwind-SQLite3/Northwind.db /db/Northwind.db

# Setup the express API for the Northwind sample database
RUN apk add nodejs-current nodejs-current-npm
WORKDIR /usr/local/tomcat/northwindAPI
COPY ./northwindAPI/package.json ./
RUN npm install

# Launch the webapp and the API server.
WORKDIR /usr/local/tomcat/
COPY ./bin/start.sh ./
CMD ["./start.sh"]
