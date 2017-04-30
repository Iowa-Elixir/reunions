defmodule Reunions.ReunionControllerTest do
  use Reunions.ConnCase

  alias Reunions.{Reunion, User}

  @valid_attrs %{location: "some content",
                 description: String.duplicate("X", 50),
                 name: "some content",
                 start_at: %{day: 17,
                              hour: 14,
                              min: 0,
                              month: 4,
                              sec: 0,
                             year: 2010},
                 end_at: %{day: 17,
                           hour: 14,
                           min: 0,
                           month: 4,
                           sec: 0,
                           year: 2010}
                  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    user = User.changeset(%User{}, %{
          name: "JoseLuis Torres",
          email: "jl@joseluistorres.me",
          password: "secret",
          password_confirmation: "secret"
        }) |> Repo.insert!
    {:ok, conn: assign(conn, :current_user, user), user: user}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, reunion_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing reunions"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, reunion_path(conn, :new)
    assert html_response(conn, 200) =~ "New reunion"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, reunion_path(conn, :create), reunion: @valid_attrs
    assert redirected_to(conn) == reunion_path(conn, :index)
    assert Repo.get_by(Reunion, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, reunion_path(conn, :create), reunion: @invalid_attrs
    assert html_response(conn, 200) =~ "New reunion"
  end

  test "shows chosen resource", %{conn: conn} do
    reunion = Repo.insert! %Reunion{}
    conn = get conn, reunion_path(conn, :show, reunion)
    assert html_response(conn, 200) =~ "Show reunion"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, reunion_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    reunion = Repo.insert! %Reunion{}
    conn = get conn, reunion_path(conn, :edit, reunion)
    assert html_response(conn, 200) =~ "Edit reunion"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    reunion = Repo.insert! %Reunion{}
    conn = put conn, reunion_path(conn, :update, reunion), reunion: @valid_attrs
    assert redirected_to(conn) == reunion_path(conn, :show, reunion)
    assert Repo.get_by(Reunion, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    reunion = Repo.insert! %Reunion{}
    conn = put conn, reunion_path(conn, :update, reunion), reunion: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit reunion"
  end

  test "deletes chosen resource", %{conn: conn} do
    reunion = Repo.insert! %Reunion{}
    conn = delete conn, reunion_path(conn, :delete, reunion)
    assert redirected_to(conn) == reunion_path(conn, :index)
    refute Repo.get(Reunion, reunion.id)
  end
end
