defmodule LiveViewStudioWeb.VolunteersLive do
  use LiveViewStudioWeb, :live_view

  alias LiveViewStudio.Volunteer
  alias LiveViewStudio.Volunteer.Volunteers

  def mount(_params,_session,socket) do

    if connected?(socket), do: Volunteer.subscribe()
    volunteers=Volunteer.list_volunteers()

    changeset= Volunteer.change_volunteers(%Volunteers{})

    socket=
      assign(socket,
      volunteers: volunteers,
      changeset: changeset
      )

    {:ok,socket}
  end

  def handle_event("save", %{"volunteers"=> params},socket) do

    case Volunteer.create_volunteers(params) do
      {:ok,volunteer}->
        changeset = Volunteer.change_volunteers(%Volunteers{})
        socket=assign(socket, changeset: changeset)

        {:noreply,socket}
      {:error, %Ecto.Changeset{}=changeset} ->
        socket= assign(socket, changeset: changeset)
        {:noreply, socket}
    end

  end


  def handle_event("validate", %{"volunteers" => params}, socket) do
    changeset=
      %Volunteers{}
      |> Volunteer.change_volunteers(params)
      |> Map.put(:action, :insert)

    socket=
      assign(socket,
      changeset: changeset
      )

      {:noreply, socket}
  end


  def handle_event("toggle-status", %{"id"=>id}, socket) do
    volunteer=Volunteer.get_volunteers!(id)

    {:ok,_volunteer}=
      Volunteer.update_volunteers(
        volunteer,
        %{checked_out: !volunteer.checked_out }
      )
      {:noreply,socket}
  end

  def handle_info({:volunteer_created, volunteer},socket) do
    socket=
      update(
        socket,
        :volunteers,
        fn volunteers-> [volunteer| volunteers] end
      )
      {:noreply, socket}

  end

  def handle_info({:volunteer_updated, volunteer},socket) do
    socket=
      update(
        socket,
        :volunteers,
        fn volunteers-> [volunteer| volunteers] end
      )
      {:noreply, socket}

  end
end
