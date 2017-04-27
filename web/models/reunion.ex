defmodule Reunions.Reunion do
  use Reunions.Web, :model

  schema "reunions" do
    field :name, :string
    field :location, :string
    field :description, :string
    belongs_to :user, Reunions.User
    field :date_at, Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :location, :description, :user_id, :date_at])
    |> validate_required([:name, :location, :description, :user_id, :date_at])
    |> validate_length(:description, min: 50)
  end
end
