defmodule RandGenWeb.UserViewTest do
  use RandGenWeb.ConnCase

  alias RandGenWeb.UserView

  describe "show.json" do
    test "with all assigns" do
      users = insert_list(2, :user)
      now = NaiveDateTime.utc_now
      assigns = [users: users, last_call_timestamp: now]

      res = UserView.render("show.json", assigns)

      assert res == %{
        users: Enum.map(users, &cast_user_assert(&1)),
        timestamp: cast_timestamp_assert(now)
      }
    end

    test "with users only" do
      users = insert_list(2, :user)
      assigns = [users: users, last_call_timestamp: nil]

      res = UserView.render("show.json", assigns)

      assert res == %{
        users: Enum.map(users, &cast_user_assert(&1)),
        timestamp: nil
      }
    end
  end

  defp cast_user_assert(user) do
    %{
      id: user.id,
      points: user.points
    }
  end

  defp cast_timestamp_assert(ts) do
    Calendar.strftime(ts, "%c")
  end
end
