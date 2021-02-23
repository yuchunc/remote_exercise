# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RandGen.Repo.insert!(%RandGen.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias RandGen.{Repo, Account}

unless Mix.env() == :test do
  now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)

  users =
    for _ <- 1..100 do
      %{points: 0, inserted_at: now, updated_at: now}
    end

  Repo.insert_all(Account.User, users)
end
