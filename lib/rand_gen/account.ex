defmodule RandGen.Account do
  use RandGen, :context

  alias RandGen.Account.User

  def get_users do
    Repo.all(User)
  end

  def get_users_by_max(max, opts \\ []) do
    limit = Keyword.get(opts, :limit, nil)

    User
    |> where([u], u.points > ^max)
    |> limit(^limit)
    |> Repo.all()
  end

  def update_user(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
