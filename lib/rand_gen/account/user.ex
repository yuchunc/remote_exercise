defmodule RandGen.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :points, :integer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:points])
    |> validate_required([:points])
    |> validate_number(:points, greater_than: -1, less_than: 101)
  end
end
