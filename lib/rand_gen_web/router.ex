defmodule RandGenWeb.Router do
  use RandGenWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RandGenWeb do
    pipe_through :api
  end
end
