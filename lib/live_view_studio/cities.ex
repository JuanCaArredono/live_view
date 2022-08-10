defmodule LiveViewStudio.Cities do
  def suggest(""),do: []

  def suggest(prefix) do
    Enum.filter(list_cities(),&has_prefix?(&1,prefix))
  end

  defp has_prefix?(city,prefix) do
    String.starts_with?(String.downcase(city),String.downcase(prefix))
  end

  def list_cities do
    [
      "Monterrey, NL",
      "Monterrey",
      "Mont, NL",
      "Monteprin, NL",
      "Zuazua, NL",
      "Zuazuo, NL",
      "Alameda, OH",
      "San Pedro, NL",
      "San juan, NL",
      "San Pepe, NL"

    ]
  end
end
