defmodule Reunions.ReunionTest do
  use Reunions.ModelCase

  alias Reunions.Reunion

  test "changeset with valid attributes" do
    attrs = %{
      description: String.duplicate("X", 50),
      location: "some content",
      name: "some content"
    }
    changeset = Reunion.changeset(%Reunion{}, attrs)
    assert changeset.valid?
  end

  test "changeset is invalid without required attributes" do
    changeset = Reunion.changeset(%Reunion{}, %{})
    refute changeset.valid?
    assert Enum.count(changeset.errors) == 3
  end

  test "changeset is invalid with required attributes and description too short" do
    attrs = %{
      description: "some description",
      location: "some content",
      name: "some content"
    }

    changeset = Reunion.changeset(%Reunion{}, attrs)

    refute changeset.valid?
    assert Enum.count(changeset.errors) == 1
    assert elem(List.first(changeset.errors), 0) == :description
  end
end
