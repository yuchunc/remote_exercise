defmodule RemoteExercise.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :point, :integer

      timestamps()
    end
  end
end
