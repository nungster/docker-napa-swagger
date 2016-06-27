#!/bin/bash -ex

echo "Checking for mysql server..."
while ! mysqladmin -h$DATABASE_HOST -p$DATABASE_PASSWORD ping; do
  echo "The api_server is unable to ping mysql, trying again." 
  sleep 5
done

sed -i "s/API_HOST_URL/${API_HOST_URL}/g" public/index.html

cd /app/api_server
rake db:reset
rake db:migrate

rackup -p 9292 --host 0.0.0.0
