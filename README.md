# README #

Hippo is a self-hosted open source project to you send private emails via gmail. It is self-hosted so images can be stored locally, maintaining the privacy of the original text.

## Install ##
### Pre-requisites
PostgreSQL: http://postgresapp.com/ (This link is for Mac OS X only)
wkhtmltoimage: https://code.google.com/p/wkhtmltopdf/downloads/list

Clone the repo:

      $ git clone https://github.com/vivster7/hippo.git

Go to the root of the Hippo directory:

     $ cd /path/to/hippo

Bundle the gems:

      $ bundle install

Create/Migrate the databases to use:

      $ rake db:create
      $ rake db:migrate

Start the rails server:

        $ rails s

(OPTIONAL) You may want to start the rails server with some environmental variables

      $ RESTRICT_DOMAIN=gmail.com rails s

Visit the service at: http://localhost:3000 to register your email. 


Download and install chrome extension: https://chrome.google.com/webstore/detail/afjapjagmajnlpndkenfhbpkempkclbb/


If you are not running Hippo on the same machine you are using the extension, you will have to point the extension to the Hippo Web Service.


Go to gmail and start sending private emails!

# Configuration #

## To enable Google+ Oauth ##

You will need to acquire a Google API key to run your local instance. 
You can get one here: https://code.google.com/apis/console/b/0/?pli=1

Create a file in config/secrets.yml, with your Google API key:

    development:
      google_key: YOUR_GOOGLE_KEY
      google_secret: YOUR_GOOGLE_SECRET

Google Auth is required for production mode.  *Do not check secrets.yml into the repository.*

## To enable Basic HTTP Authorization ##

Create/edit config/secrets.yml, with your auth name and password:

    development:
      basic_auth_name: YOUR_AUTH_NAME
      basic_auth_pass: YOUR_AUTH_PASS


