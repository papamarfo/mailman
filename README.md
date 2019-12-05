# Mailman
Learn how to send emails in Phoenix

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development purposes.


### Installing

Please run the following commands to setup your development env up.

```bash
# clone this repository
git clone https://github.com/manfordbenjamin/mailman.git

# change directory
cd mailman/

# install the project's dependencies with
mix deps.get

# create and migrate your database with 
mix ecto.setup

# install Node.js dependencies with
cd assets && npm install

# make a copy of the .env.example to configure the application 
# for your local environment
cp .env.example .env
```

### Configuring the mail server

Please update the values for the mail server in `.env`.

#### Example configuration with ['mailtrap'](https://mailtrap.io)
```bash
export MAIL_HOST=smtp.mailtrap.io
export MAIL_PORT=2525
export MAIL_USERNAME=a79bc040f92edb
export MAIL_PASSWORD=1c8f115af621b1
```

#### Example configuration with ['sendgrid'](https://sendgrid.com)
```bash
export MAIL_HOST=smtp.sendgrid.net
export MAIL_PORT=2525
export MAIL_USERNAME=a79bc040f92edb
export MAIL_PASSWORD=1c8f115af621b1
```

### Running the application

Load the `.env` file and run Phoenix server:

```bash
# load the configuration in the .env file. NB: Use git bash if you are on windows
source .env

# start Phoenix endpoint with
mix phx.server
```
Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.