# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :mailman,
  ecto_repos: [Mailman.Repo]

# Configures the endpoint
config :mailman, MailmanWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7nzPR7TgpcEL2ue/S2gGYTgkBwQkXmM8XyJlIN7PRr9dShWYeKXn3gDr90NNugyh",
  render_errors: [view: MailmanWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Mailman.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures Elixir's Mailer
config :mailman, Mailman.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: System.get_env("MAIL_HOST"),
  port: System.get_env("MAIL_PORT"),
  username: System.get_env("MAIL_USERNAME"),
  password: System.get_env("MAIL_PASSWORD"),
  tls: :if_available, # can be `:always` or `:never`
  ssl: false, # can be `true`
  retries: 1,
  no_mx_lookups: false, # can be `true`
  auth: :if_available # can be `:always`. If your smtp relay requires authentication set it to `:always`.

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
