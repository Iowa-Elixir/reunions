defmodule Reunions.Reunion do
  use Reunions.Web, :model

  schema "reunions" do
    field :name, :string
    field :location, :string
    field :description, :string
    field :start_at, Ecto.DateTime
    field :end_at, Ecto.DateTime
    belongs_to :user, Reunions.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :location, :description, :user_id,
                     :start_at, :end_at])
    |> validate_required([:name, :location, :description, :user_id,
                          :start_at, :end_at])
    |> validate_length(:description, min: 50)
  end
end
