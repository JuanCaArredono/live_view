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
  model: " super boAT",
  price: "$$$",
  type: "CHILL",
  image: "/images/boats/boat1.jpg"
}
|> Repo.insert!()

%Boat{
  model: "boat hulk",
  price: "$$",
  type: "fishing",
  image: "/home/vagrant/proyectosp/live_view_studio/assets/static/images/boats/boat3.jpg"
}
|> Repo.insert!()

%Boat{
  model: "boat deluxe",
  price: "$",
  type: "deluxe",
  image: "/home/vagrant/proyectosp/live_view_studio/assets/static/images/boats/boat4.jpg"
}
|> Repo.insert!()

%Boat{
  model: "1900 boat ",
  price: "$$",
  type: "deluxe",
  image: "/home/vagrant/proyectosp/live_view_studio/assets/static/images/boats/boat5.jpg"
}
|> Repo.insert!()

%Boat{
  model: "Santa Maria",
  price: "$",
  type: "navigation",
  image: "/home/vagrant/proyectosp/live_view_studio/assets/static/images/boats/boat6.jpg"
}
|> Repo.insert!()

%Boat{
  model: "Boat safe",
  price: "$$$",
  type: "boat",
  image: "/home/vagrant/proyectosp/live_view_studio/assets/static/images/boats/boat7.jpg"
}
|> Repo.insert!()

%Boat{
  model: "frist Boat",
  price: "$$",
  type: "fishing",
  image: "/home/vagrant/proyectosp/live_view_studio/assets/static/images/boats/boat8.jpg"
}
|> Repo.insert!()

%Boat{
  model: "Boat super Delux",
  price: "$$$",
  type: "delux pro",
  image: "/home/vagrant/proyectosp/live_view_studio/assets/static/images/boats/boat9.jpg"
}
|> Repo.insert!()

%Boat{
  model: "boat titanic",
  price: "$",
  type: "titanic",
  image: "/home/vagrant/proyectosp/live_view_studio/assets/static/images/boats/boat2.jpg"
}
|> Repo.insert!()
