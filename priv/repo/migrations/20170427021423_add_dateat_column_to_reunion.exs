defmodule Reunions.Repo.Migrations.CreateReunion do
  use Ecto.Migration

  def change do
    alter table(:reunions) do
      add :start_at, :utc_datetime
      add :end_at, :utc_datetime
    end
  end
end
