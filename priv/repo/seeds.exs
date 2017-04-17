# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Reunions.Repo.insert!(%Reunions.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Reunions.Repo.delete_all Reunions.User

Reunions.User.changeset(
  %Reunions.User{}, %{name: "JoseLuis Torres", email: "jl@joseluistorres.me", password: "secret", password_confirmation: "secret"})
|> Reunions.Repo.insert!