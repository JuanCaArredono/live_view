defmodule LiveViewStudioWeb.SalesDashboardLive do
  use LiveViewStudioWeb, :live_view
  alias LiveViewStudio.Sales

  def mount(_params,_session,socket) do
    if connected?(socket) do
      :timer.send_interval(1000,self(),:tick)
    end
    socket=assign_stats(socket)
    {:ok,socket}
  end

  def render(assigns)do
    ~L"""
      <h1> Sales  Dashboard </h1>
      <div id="dashboard">
        <div class="stats">
          <div class="stat">
            <span class="value">
              <%= @new_orders %>
            </span>
            <span class="name">
              new_orders
            </span>
          </div>

          <div class="stat">
            <span class="value">
              <%= @sales_amount %>
            </span>
            <span class="name">
              sales_amount
            </span>
          </div>

          <div class="stat">
            <span class="value">
              <%= @satisfaction %>
            </span>
            <span class="name">
              satisfaction
            </span>
          </div>
        </div>
        <button>
          Refresh 🌀
        </button>
      </div>

    """
  end

  def handle_event("refresh",_,socket)do
    socket=assign_stats(socket)
    {:norelpy,socket}
  end

  def handle_info(:tick,socket)do
    socket=assign_stats(socket)
    {:noreply,socket}
  end

  defp assign_stats(socket) do
    assign(socket,
    new_orders: Sales.new_order(),
    sales_amount: Sales.sales_amount(),
    satisfaction: Sales.satisfaction()
    )
  end

end
