# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :califa,
  ecto_repos: [Califa.Repo]

# Configures the endpoint
config :califa, CalifaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iNEDKdO+94FwU1tsJzJutSWLdkE5H8sI3BBiJYD8sAZWHgAJcwKELhSrpQRqpeYQ",
  render_errors: [view: CalifaWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Califa.PubSub,
  live_view: [signing_salt: "oi97Esqz"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Money default currency
config :money, default_currency: :MXN

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
