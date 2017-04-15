defmodule Reunions.Reunion do
  use Reunions.Web, :model

  schema "reunions" do
    field :name, :string
    field :location, :string
    field :description, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :location, :description])
    |> validate_required([:name, :location, :description])
    |> validate_length(:description, min: 50)
  end
end
