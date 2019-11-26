# Mailman
Learn how to send emails in Phoenix

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.


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

# start Phoenix endpoint with
mix phx.server
```
Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


### Configuring the mail server

Please update the values for the mailer in `config/config.exs`.

#### Example configuration with ['mailtrap'](https://mailtrap.io)
```bash
config :mailman, Mailman.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.mailtrap.io",
  port: 2525,
  username: "a79bk040f94ebd", # or {:system, "SMTP_USERNAME"}
  password: "1c8f225af691b1", # or {:system, "SMTP_PASSWORD"}
  tls: :if_available, # can be `:always` or `:never`
  ssl: false, # can be `true`
  retries: 1,
  no_mx_lookups: false, # can be `true`
  auth: :if_available # can be `:always`. If your smtp relay requires authentication set it to `:always`.
```

#### Example configuration with ['sendgrid'](https://sendgrid.com)
```bash
config :mailman, Mailman.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.sendgrid.net",
  port: 2525,
  username: "app134487840", # or {:system, "SMTP_USERNAME"}
  password: "tlmefwfi9209", # or {:system, "SMTP_PASSWORD"}
  tls: :if_available, # can be `:always` or `:never`
  ssl: false, # can be `true`
  retries: 1,
  no_mx_lookups: false, # can be `true`
  auth: :if_available # can be `:always`. If your smtp relay requires authentication set it to `:always`.
```

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
