defmodule Reunions.ReunionController do
  use Reunions.Web, :controller

  alias Reunions.Reunion

  def index(conn, _params) do
    reunions = Repo.all(Reunion)
    render(conn, "index.html", reunions: reunions)
  end

  def new(conn, _params) do
    changeset = Reunion.changeset(%Reunion{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"reunion" => reunion_params}) do
    changeset = Reunion.changeset(%Reunion{}, reunion_params)

    case Repo.insert(changeset) do
      {:ok, _reunion} ->
        conn
        |> put_flash(:info, "Reunion created successfully.")
        |> redirect(to: reunion_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    reunion = Repo.get!(Reunion, id)
    render(conn, "show.html", reunion: reunion)
  end

  def edit(conn, %{"id" => id}) do
    reunion = Repo.get!(Reunion, id)
    changeset = Reunion.changeset(reunion)
    render(conn, "edit.html", reunion: reunion, changeset: changeset)
  end

  def update(conn, %{"id" => id, "reunion" => reunion_params}) do
    reunion = Repo.get!(Reunion, id)
    changeset = Reunion.changeset(reunion, reunion_params)

    case Repo.update(changeset) do
      {:ok, reunion} ->
        conn
        |> put_flash(:info, "Reunion updated successfully.")
        |> redirect(to: reunion_path(conn, :show, reunion))
      {:error, changeset} ->
        render(conn, "edit.html", reunion: reunion, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    reunion = Repo.get!(Reunion, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(reunion)

    conn
    |> put_flash(:info, "Reunion deleted successfully.")
    |> redirect(to: reunion_path(conn, :index))
  end
end
