defmodule Reunions.Repo.Migrations.AddUserIdToReunions do
  use Ecto.Migration

  def change do
    alter table(:reunions) do
      add :user_id, references(:users, on_delete: :nothing)
    end
    create index(:reunions, [:user_id])
  end
end
