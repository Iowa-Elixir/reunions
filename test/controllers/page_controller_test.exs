defmodule Reunions.PageControllerTest do
  use Reunions.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "A place to Learn about Elixir"
  end
end
