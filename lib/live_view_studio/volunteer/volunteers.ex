defmodule LiveViewStudio.Volunteer.Volunteers do
  use Ecto.Schema
  import Ecto.Changeset

  schema "volunteers" do
    field :checked_out, :boolean, default: false
    field :name, :string
    field :phone, :string

    timestamps()
  end

  @phone ~r/^\d{3}[\s-.]?\d{3}[\s-.]?\d{4}$/

  @doc false
  def changeset(volunteers, attrs) do
    volunteers
    |> cast(attrs, [:name, :phone, :checked_out])
    |> validate_required([:name, :phone])
    |> validate_length(:name,min: 3, max: 100)
    |> validate_format(:phone,@phone,message: "numero invalido")
  end
end
