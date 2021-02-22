defmodule RandGen.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :points, :integer, null: false

      timestamps()
    end

    create index(:users, :points)
    create constraint(:users, :points, check: "points >= 0 AND points <= 100")
  end
end
