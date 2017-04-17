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

alias Reunions.Repo
alias Reunions.Reunion
alias Reunions.User

# Clear tables
Repo.delete_all Reunion
Repo.delete_all User

# Reunion seeds
Reunion.changeset(%Reunion{}, %{
  name: "Iowa Ruby Brigade",
  location: "Des Moines, IA",
  description: "The Iowa Ruby Brigade is a user group for Ruby and Rails enthusiasts."
}) |> Repo.insert!

Reunion.changeset(%Reunion{}, %{
  name: "Iowa |> Elixir",
  location: "Des Moines, IA",
  description: "Iowa Elixir is a user group for Elixir and Phoenix enthusiasts."
}) |> Repo.insert!

Reunion.changeset(%Reunion{}, %{
  name: "DSM Web Geeks",
  location: "Des Moines, IA",
  description: "We are a group of web enthusiasts with diverse interests covering the full spectrum of web and mobile design, development and marketing. We meet monthly and you are welcome to join."
}) |> Repo.insert!

# User seeds
User.changeset(%User{}, %{
  name: "JoseLuis Torres",
  email: "jl@joseluistorres.me",
  password: "secret",
  password_confirmation: "secret"
}) |> Repo.insert!
