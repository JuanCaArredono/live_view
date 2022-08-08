defmodule LiveViewStudioWeb.LightLive do
  use LiveViewStudioWeb, :live_view

  def mount(_params, _session, socket) do
    socket=assign(socket,:brightness,10)
    #IO.inspect(socket)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Front porch Ligts</h1>
    <div id= "light">
    <div class="meter">
      <span style="width: <%= @brightness %>%">
        <%= @brightness %>%
      </span>
    </div>
      <button phx-click="off">
        off
      </button>
      <button phx-click="dawn">
        dawn
      </button>
      <button phx-click="up">
      up
    </button>
      <button phx-click="on">
        on
      </button>
    </div>
    """
  end

  def handle_event("on",_,socket)do
    socket=assign(socket, :brightness,100)
    {:noreply,socket}

  end

  def handle_event("up",_,socket) do
    socket=update(socket, :brightness, &min(&1 + 10, 100))
    {:noreply,socket}

  end

  def handle_event("dawn",_,socket) do
    socket=update(socket, :brightness, &max(&1 - 10, 0))
    {:noreply,socket}

  end

  def handle_event("off",_,socket) do
    socket=assign(socket, :brightness,0)
    {:noreply,socket}

  end

end
