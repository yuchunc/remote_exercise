defmodule RandGenWeb.UserView do
  use RandGenWeb, :view

  def render("show.json", assigns) do
    %{
      users: cast_users(assigns.users),
      timestamp: cast_timestamp(assigns.last_call_timestamp)
    }
    |> Jason.encode!(assigns)
  end

  def cast_users(users) do
    Enum.map(users, &%{id: &1.id, points: &1.points})
  end

  def cast_timestamp(nil) do
    nil
  end

  def cast_timestamp(ts) do
    Calendar.strftime(ts, "%c")
  end
end
