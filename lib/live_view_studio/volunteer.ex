defmodule LiveViewStudio.Volunteer do
  @moduledoc """
  The Volunteer context.
  """

  import Ecto.Query, warn: false
  alias LiveViewStudio.Repo

  alias LiveViewStudio.Volunteer.Volunteers

  @doc """
  Returns the list of volunteers.

  ## Examples

      iex> list_volunteers()
      [%Volunteers{}, ...]

  """
  def list_volunteers do
    Repo.all(Volunteers)
  end

  @doc """
  Gets a single volunteers.

  Raises `Ecto.NoResultsError` if the Volunteers does not exist.

  ## Examples

      iex> get_volunteers!(123)
      %Volunteers{}

      iex> get_volunteers!(456)
      ** (Ecto.NoResultsError)

  """
  def get_volunteers!(id), do: Repo.get!(Volunteers, id)

  @doc """
  Creates a volunteers.

  ## Examples

      iex> create_volunteers(%{field: value})
      {:ok, %Volunteers{}}

      iex> create_volunteers(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_volunteers(attrs \\ %{}) do
    %Volunteers{}
    |> Volunteers.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a volunteers.

  ## Examples

      iex> update_volunteers(volunteers, %{field: new_value})
      {:ok, %Volunteers{}}

      iex> update_volunteers(volunteers, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_volunteers(%Volunteers{} = volunteers, attrs) do
    volunteers
    |> Volunteers.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a volunteers.

  ## Examples

      iex> delete_volunteers(volunteers)
      {:ok, %Volunteers{}}

      iex> delete_volunteers(volunteers)
      {:error, %Ecto.Changeset{}}

  """
  def delete_volunteers(%Volunteers{} = volunteers) do
    Repo.delete(volunteers)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking volunteers changes.

  ## Examples

      iex> change_volunteers(volunteers)
      %Ecto.Changeset{data: %Volunteers{}}

  """
  def change_volunteers(%Volunteers{} = volunteers, attrs \\ %{}) do
    Volunteers.changeset(volunteers, attrs)
  end
end
