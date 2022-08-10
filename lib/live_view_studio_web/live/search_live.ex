defmodule LiveViewStudioWeb.SearchLive do
  use LiveViewStudioWeb, :live_view

  alias LiveViewStudio.Stores
  alias LiveViewStudio.Cities

  def mount(_params,_session,socket) do
    socket=
      assign(socket,
      zip: "",
      city: "",
      stores: [],
      matches: [],
      loading: false
      )
    {:ok,socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Find a Store</h1>
    <div id="search">

      <form phx-submit="zip_search">
        <input type="text" name="zip" value="<%= @zip %>"
                placeholder="Zip Code"
                autofocus autocomplete="off"
                <%= if @loading , do: "readonly" %>  />

        <button type="submit">
        Search
        </button>
      </form>

      <form phx-submit="city_search" phx-change="suggest-city">
      <input type="text" name="city" value="<%= @city %>"
              placeholder="City"
              list="matches"
              autofocus autocomplete="off"
              <%= if @loading , do: "readonly" %>  />

      <button type="submit">
      Search
      </button>
      </form>

      <datalist id="matches">
        <% for match <- @matches do %>
          <option value="<%= match %>"> <%= match %> </option>
        <% end %>
      </datalist>


      <%= if @loading do %>
        <div class="loader">
        </div>
      <% end %>

      <div class="stores">
        <ul>
          <%= for store <- @stores do %>
          <li>
            <div class="fris-line">
              <div class="name">
                <%= store.name%>
              </div>
              <div class= "status">
                <%= if store.open do %>
                  <span class="open"> Open</span>
                <% else %>
                    <span class="closed"> Closed</span>
                <%end%>
              </div>
            </div>
            <div class="second-line">
              <div class="street">
                <%= store.street %>
              </div>
              <div class="phone_number">
              <%= store.phone_number%>
              </div>
            </div>
          </li>
          <% end %>
        </ul>
      </div>
    """
  end

  def handle_event("city_search", %{"city"=> city},socket) do

    send(self(),{:run_city_search,city})
    socket=
      assign(socket,
      city: city,
      stores: [],
      loading: true
      )

    {:noreply,socket}
  end

  def handle_event("zip_search", %{"zip"=> zip},socket) do

    send(self(),{:run_zip_search,zip})
    socket=
      assign(socket,
      zip: zip,
      stores: [],
      loading: true
      )

    {:noreply,socket}
  end

  def handle_event("suggest-city", %{"city"=> prefix},socket) do
    socket=
      assign(socket,
      matches: Cities.suggest(prefix)
      )

    {:noreply,socket}
  end


  def handle_info({:run_zip_search,zip}, socket) do
    case Stores.search_by_zip(zip) do
      []->
        socket=
          socket
          |> put_flash(:info,"No stores matching \"#{zip}\"")
          |> assign(stores: [], loading: false)
        {:noreply,socket}

      stores->
        socket=
          assign(socket,
          stores: stores,
          loading: false
          )

        {:noreply,socket}
    end
  end

    def handle_info({:run_city_search,city}, socket) do
      case Stores.search_by_city(city) do
        []->
          socket=
            socket
            |> put_flash(:info,"No stores matching \"#{city}\"")
            |> assign(stores: [], loading: false)
          {:noreply,socket}

        stores->
          socket=
            assign(socket,
            stores: stores,
            loading: false
            )

          {:noreply,socket}
      end

    end
end
