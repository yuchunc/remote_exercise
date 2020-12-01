defmodule RemoteExercise.AccountTest do
  use RemoteExercise.DataCase

  alias RemoteExercise.Account
  alias Account.User

  describe "update_point/1" do
    test "updates all user in db with given point" do
      user = Repo.all(User) |> Enum.random()

      Account.update_point(1)

      assert %{point: 1} = Repo.get(User, user.id)
    end
  end

  describe "do_query_users/2" do
    test "get users by the limit" do
      Account.update_point(99)
      assert [_, _] = Account.do_query_users(50, %{limit: 2})
    end
  end
end
