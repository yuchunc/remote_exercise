# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rand_gen,
  ecto_repos: [RandGen.Repo]

# Configures the endpoint
config :rand_gen, RandGenWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tCR+gVYLrFiUmhVbKG69l17UceuWT1AUv7gm1kJsKXPo0Va1bOqlKuznUk5IC8Dy",
  render_errors: [view: RandGenWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: RandGen.PubSub,
  live_view: [signing_salt: "li24uHDr"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
