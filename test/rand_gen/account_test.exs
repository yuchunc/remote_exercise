defmodule RandGen.AccountTest do
  use RandGen.DataCase

  alias RandGen.Account
  alias Account.User

  describe "get_users/0" do
    test "retrieves all users" do
      insert_list(3, :user)

      assert Account.get_users() |> Enum.count() == 3
    end
  end

  describe "get_users_by_max/2" do
    setup do
      for n <- Enum.take_every(1..10, 2) do
        insert(:user, points: n)
      end

      {:ok, max: 4}
    end

    test "retrieves users with points greater than max", ctx do
      %{max: max} = ctx
      res = Account.get_users_by_max(max)

      assert Enum.filter(res, &(&1.points <= max)) == []
    end

    test "retrieves users with points greater than max, limit 2", ctx do
      %{max: max} = ctx
      res = Account.get_users_by_max(max, limit: 2)

      assert Enum.count(res) == 2
    end
  end

  describe "update_user/2" do
    test "updates user's point value" do
      user = insert(:user, points: 0)

      Account.update_user(user, %{points: 10})

      assert Repo.get(User, user.id).points == 10
    end
  end
end
