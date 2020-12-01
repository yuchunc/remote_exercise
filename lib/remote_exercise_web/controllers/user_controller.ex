defmodule RemoteExerciseWeb.UserController do
  use RemoteExerciseWeb, :controller

  alias RemoteExercise.Account

  def all(conn, _) do
    {users, dt} = Account.query_users()

    json(conn, %{users: users, timestamp: NaiveDateTime.truncate(dt, :second)})
  end
end
