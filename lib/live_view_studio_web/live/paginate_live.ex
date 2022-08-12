defmodule LiveViewStudioWeb.PaginateLive do
  use LiveViewStudioWeb, :live_view

  alias LiveViewStudio.Donations

  def mount(_params,_session, socket) do
    {:ok, socket, temporary_assigns: [donations: []]}
  end

  def handle_params(params,_url,socket) do
    page=String.to_integer(params["page"] || "1")
    per_page= String.to_integer(params["per_page"] || "5")

    paginate_options =%{page: page, per_page: per_page}
    donations= Donations.list_donations(paginate: paginate_options )

    socket= assign(socket,
    options: paginate_options,
    donations: donations)

    {:noreply,socket}
  end


  defp expires_class(donation) do
    if Donations.almost_expired?(donation), do: "eat-now", else: "fresh"
  end
end
