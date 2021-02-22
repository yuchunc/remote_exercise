defmodule RandGen.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      RandGen.Repo,
      # Start the Telemetry supervisor
      RandGenWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: RandGen.PubSub},
      # Start the Endpoint (http/https)
      RandGenWeb.Endpoint
      # Start a worker by calling: RandGen.Worker.start_link(arg)
      # {RandGen.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RandGen.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RandGenWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
