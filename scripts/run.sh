#!/bin/bash -ex

# Wait for the mysql container/database is ready before proceeding
#
echo "Checking for mysql server..."
while ! mysqladmin -h$DATABASE_HOST -p$DATABASE_PASSWORD ping; do
  echo "The api_server is unable to ping mysql, trying again." 
  sleep 5
done

# Update the Swagger UI explorer witha default landing endpoint
#
sed -i "s/API_HOST_URL/${API_HOST_URL}/g" public/index.html

cd /app/api_server

# Drop and Setup a database
# You may want to handle this seperately, or enable some kind of check before running these migrations on production deployments.

rake db:reset
# Run migrations
rake db:migrate

# Start the rack server.  Default port called out on 0.0.0.0 to force Docker to use IPV4.  Without this, it may opt for IPV6 and you won't be able to each your API server.

rackup -p 9292 --host 0.0.0.0
