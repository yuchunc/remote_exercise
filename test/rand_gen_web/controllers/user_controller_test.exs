defmodule RandGenWeb.UserControllerTest do
  use RandGenWeb.ConnCase

  test "GET /", %{conn: conn} do
    user_ids =
      insert_list(100, :user)
      |> Enum.map(& &1.id)

    poke_randomizer()

    conn0 = get(conn, "/")

    assert %{"users" => users, "timestamp" => nil} = json_response(conn0, 200)
    assert Enum.reject(users, &(&1["id"] in user_ids)) == []

    poke_randomizer()

    conn1 = get(conn, "/")

    assert %{"users" => _, "timestamp" => ts} = json_response(conn1, 200)
    assert String.match?(ts, ~r/\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}/)
  end

  def poke_randomizer do
    RandGen.Randomizer
    |> Process.whereis()
    |> send(:update_points)
  end
end
