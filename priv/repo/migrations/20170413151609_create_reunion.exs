defmodule Reunions.Repo.Migrations.CreateReunion do
  use Ecto.Migration

  def change do
    create table(:reunions) do
      add :name, :string
      add :location, :string
      add :description, :string

      timestamps()
    end

  end
end
