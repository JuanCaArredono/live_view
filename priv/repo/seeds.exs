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
alias LiveViewStudio.Donations.Donation

donation_items= [
  {"☕","coffee"},
  {"🥛","Milk"},
  {"🐔","chicken"},
  {"🥔","potato"},
  {"🍲","food"},
  {"🍒","cherrys"},
  {"🥚","Eggs"},
  {"🍭","candy"},
  {"🥓","bacon"},
  {"🍅","tomato"},
  {"🥦","brocoli"},
  {"🥕","zanaoria"},
  {"🍩","donut"},
  {"🍺","cerveza"},
  {"🍏","manzana verde"},
  {"🍐","Pera"},
  {"🍊","naranja"},
  {"🥑","Aguacate"},
  {"🌶","Chile"},
  {"🧄","Ajo"},
  {"🥒","Pepino"},
  {"🌽","maiz"},
  {"🍍","Piña"},
  {"🍓","fresa"},
  {"🍌","Platano"}
]

for _i <- 1..100  do

  {emoji,item} = Enum.random(donation_items)

  %Donation{
    emoji: emoji,
    item: item,
    quantity: Enum.random(1..20),
    days_until_expires: Enum.random(1..30)
  }
  |> Repo.insert!()
end
