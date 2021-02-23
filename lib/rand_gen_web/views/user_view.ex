defmodule RandGenWeb.UserView do
  use RandGenWeb, :view

  def render("show.json", assigns) do
    %{
      users: Enum.map(assigns.users, &cast_user_json(&1)),
      timestamp: cast_timestamp(assigns[:last_call_timestamp])
    }
  end

  defp cast_user_json(user) do
    %{id: user.id, points: user.points}
  end

  defp cast_timestamp(nil) do
    nil
  end

  defp cast_timestamp(ts) do
    Calendar.strftime(ts, "%c")
  end
end
