defmodule RemoteExercise.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :point, :integer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:point])
    |> validate_number(:point, greater_than: -1, less_than: 101)
    |> validate_required([:point])
  end
end
