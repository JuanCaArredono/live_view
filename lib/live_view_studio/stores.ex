defmodule LiveViewStudio.Stores do
  def search_by_zip(zip) do
    :timer.sleep(2000)
    list_stores()
    |> Enum.filter(&(&1.zip==zip))
  end

  def search_by_city(city) do
    list_stores()
    |>Enum.filter(&(&1.city==city))
  end

  def list_stores do
    [
      %{
        name: "appleStore",
        street: "312 Avenue",
        phone_number: "123-123-123",
        city: "Monterrey",
        zip: "1111",
        open: true,
        hours: "8am- - 10pm M-F"

      },
      %{
        name: "appleStore",
        street: "312 Montana",
        phone_number: "123-123-123",
        city: "Monterrey",
        zip: "1112",
        open: true,
        hours: "8am- - 10pm M-F"

      },
      %{
        name: "appleStore",
        street: "312 Moue",
        phone_number: "123-123-123",
        city: "Monterrey",
        zip: "1112",
        open: true,
        hours: "8am- - 10pm M-F"

      },
      %{
        name: "appleStore",
        street: "31na Avenue",
        phone_number: "123-123-123",
        city: "Monterrey",
        zip: "1111",
        open: true,
        hours: "8am- - 10pm M-F"

      },
      %{
        name: "appleStore",
        street: "3 Avenue",
        phone_number: "123-123-123",
        city: "Monterrey",
        zip: "1113",
        open: true,
        hours: "8am- - 10pm M-F"

      },
      %{
        name: "appleStore",
        street: "312 Montana Avenue",
        phone_number: "123-123-123",
        city: "Zuazua",
        zip: "1113",
        open: true,
        hours: "8am- - 10pm M-F"

      }
    ]
  end
end
