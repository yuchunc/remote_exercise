defmodule RandGenWeb.TestUtils do
  def cast_user_assert(user) do
    %{
      id: user.id,
      points: user.points
    }
  end

  def cast_timestamp_assert(ts) do
    Calendar.strftime(ts, "%c")
  end
end
