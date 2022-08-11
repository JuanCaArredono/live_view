# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LiveViewStudio.Repo.insert!(%LiveViewStudio.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias LiveViewStudio.Repo
alias LiveViewStudio.Boats.Boat


%Boat{
  model: "Boat super Delux",
  price: "$$$",
  type: "delux pro",
  image: "/images/boats/boat5.jpg"
}
|> Repo.insert!()

%Boat{
  model: "boat titanic",
  price: "$",
  type: "titanic",
  image: "/images/boats/boat1.jpg"
}
|> Repo.insert!()
