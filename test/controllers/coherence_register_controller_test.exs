defmodule Reunions.CoherenceRegisterControllerTest do
  use Reunions.ConnCase
  import Reunions.Router.Helpers

  alias Reunions.User
  @base_attrs %{email: "some@content", name: "some content"}
  @valid_attrs Enum.into [password: "secret", password_confirmation: "secret"], @base_attrs
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: conn}
  end

  test "renders form for new registration", %{conn: conn} do
    conn = get conn, registration_path(conn, :new)
    assert html_response(conn, 200) =~ "Register Account"
  end

  test "creates account", %{conn: conn} do
    conn = post conn, registration_path(conn, :create), registration: @valid_attrs
    assert redirected_to(conn) == Coherence.Config.logged_out_url
  end
end
