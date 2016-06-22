#!/bin/bash -ex

echo "Checking for mysql server..."
while ! mysqladmin -h$DATABASE_HOST -p$DATABASE_PASSWORD ping; do
  echo "The api_server is unable to ping mysql, trying again." 
  sleep 5
done


cd /app/api_server
rake db:reset

#rackup -p 0.0.0.0:9292
rackup
