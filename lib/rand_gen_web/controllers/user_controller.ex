defmodule RandGenWeb.UserController do
  use RandGenWeb, :controller

  alias RandGen.Randomizer

  def show(conn, _) do
    {users, ts} = Randomizer.get_users()

    conn
    |> put_resp_header("content-type", "application/json")
    |> render("show.json", users: users, last_call_timestamp: ts)
  end
end
