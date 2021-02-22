defmodule RandGen.Repo do
  use Ecto.Repo,
    otp_app: :rand_gen,
    adapter: Ecto.Adapters.Postgres
end
