# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :remote_exercise,
  ecto_repos: [RemoteExercise.Repo]

# Configures the endpoint
config :remote_exercise, RemoteExerciseWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jJT3qB32e1Fgdvv6WoVcCudq5qjdRL0V4eHbR60/NMMQnvUlBHU/2KvzxM6IHf5j",
  render_errors: [view: RemoteExerciseWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: RemoteExercise.PubSub,
  live_view: [signing_salt: "wQNTM8EZ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
