# Apple Push Notifications for Puc

In order to notify VOIP apps in the background, Apple has allowed special VOIP push notifications to be sent so that VOIP apps do not drain the battery when not in use.  We have to implement this for iOS 9 and Puc to keep registration alive.

A VOIP Push Notification certificate from Apple is needed in order to send notifications.  This certificate is a combination public and private key certificate .pem.  It is stored in files/apn_voip/puc_voip.pem

## Converting Your Certificate

> These instructions come from the [APN on Rails](https://github.com/PRX/apn_on_rails) project, which is another great option for sending push notifications.

Once you have the certificate from Apple for your application, export your key
and the apple certificate as p12 files. Here is a quick walkthrough on how to do this:

1. Click the disclosure arrow next to your certificate in Keychain Access and select the certificate and the key.
2. Right click and choose `Export 2 items…`.
3. Choose the p12 format from the drop down and name it `cert.p12`.

Now covert the p12 file to a pem file:

    $ openssl pkcs12 -in cert.p12 -out apple_push_notification.pem -nodes -clcerts


The notifications are pushed using Houston, https://github.com/nomad/houston

## Running the container

This container will run a script that will iterate through a list of VOIP tokens and send a simple message every 280 seconds.

Place tokens in tokens_file.txt, then build and run the container.

To build and run using Docker:

   docker build -t apn .
   docker run --name apn -ti -d apn

To build and run using docker-compose:

  docker-compose build
  docker-compose up -d
