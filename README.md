# docker napa grape swagger api

Make Ruby Grape APIs with this docker-compose project.  Conveniently deployed with Napa framework which is "designed to make it easy to quickly create and deploy new API services by providing generators, middlewares and a console similar to what you would expect from a Rails app."

The Napa repo can be found here https://github.com/bellycard/napa
Ruby Grape repo here https://github.com/ruby-grape

And all this wrapped up with Swagger documentation enabled, and Swagger UI deployed from file distribution in the public folder.

More information on Swagger UI can be found here https://github.com/swagger-api/swagger-ui

## Running with Docker Compose
Modify the .env file with your database and endpoint URL.  The API_HOST_URL variable is what will autofill the API explorer in the Swagger UI for convenience.
```
docker-compose up -d
```
To get to the Swagger UI, point your browser to http://HOST_IP_OR_NAME:8080/api/index.html
A sample API is mounted on /docs and in the Swagger UI explore can be viewed when pointed to http://HOST_IP_OR_NAME:8080/docs
