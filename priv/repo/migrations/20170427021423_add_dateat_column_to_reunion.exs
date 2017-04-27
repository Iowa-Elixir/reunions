defmodule Reunions.Repo.Migrations.CreateReunion do
  use Ecto.Migration

  def change do
    alter table(:reunions) do
      add :date_at, :utc_datetime
    end
  end
end
