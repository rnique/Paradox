#!/bin/bash

if [ $TRAVIS_BRANCH == "devel" ]; then
  sudo wget http://www.arangodb.org/repositories/devel/xUbuntu_12.04/Release.key
  sudo apt-key add - < Release.key  
  echo deb http://www.arangodb.org/repositories/devel/xUbuntu_12.04/ / | sudo tee /etc/apt/sources.list.d/arangodb.list
elif [ $TRAVIS_BRANCH == "master" ]; then
  sudo wget http://www.arangodb.org/repositories/stable/xUbuntu_12.04/Release.key
  sudo apt-key add - < Release.key  
  echo deb http://www.arangodb.org/repositories/stable/xUbuntu_12.04/ / | sudo tee /etc/apt/sources.list.d/arangodb.list
fi

sudo apt-get update
sudo apt-get install arangodb=1.4.3

echo "Waiting until ArangoDB is ready on port 8529"
while [[ -z `curl -s 'http://127.0.0.1:8529/_api/version' ` ]] ; do
  echo -n "."
  sleep 2s
done
