defmodule RandGenWeb.Router do
  use RandGenWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RandGenWeb do
    pipe_through :api

    get "/", UserController, :show
  end
end
