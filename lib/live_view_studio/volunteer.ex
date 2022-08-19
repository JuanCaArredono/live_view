defmodule LiveViewStudio.Volunteer do
  @moduledoc """
  The Volunteer context.
  """

  import Ecto.Query, warn: false
  alias LiveViewStudio.Repo
  alias Phoenix.PubSub
  alias LiveViewStudio.Volunteer.Volunteers


  def subscribe do
    Phoenix.PubSub.subscribe(LiveViewStudio.PubSub, "volunteers")
  end

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
      |> broadcast(:volunteer_created)

  end

  def update_volunteers(%Volunteers{} = volunteers, attrs) do
    volunteers
    |> Volunteers.changeset(attrs)
    |> Repo.update()
    |> broadcast(:volunteer_update)

  end

  def broadcast({:ok,volunteer},event) do

    Phoenix.PubSub.broadcast(
      LiveViewStudio.PubSub,
      "volunteers",
      {event,volunteer}
    )
    {:ok, volunteer}
  end

  def broadcast({:error,_reason}=error,_event), do: error


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
