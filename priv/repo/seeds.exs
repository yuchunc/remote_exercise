# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RemoteExercise.Repo.insert!(%RemoteExercise.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias RemoteExercise.{Repo, Account}

now = NaiveDateTime.utc_now |> NaiveDateTime.truncate(:second)
users = for _ <- 1..100 do
  %{point: 0, inserted_at: now, updated_at: now}
end
Repo.insert_all(Account.User, users)

