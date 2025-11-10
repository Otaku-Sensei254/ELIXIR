defmodule UiPhxWeb.FirstLive do
  use UiPhxWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :count, 0)}
  end

  def handle_event("inc", _params, socket) do
    {:noreply, update(socket, :count, &(&1 + 1))}
  end

  def render(assigns) do
    ~H"""
    <div class="p-8 text-center">
      <h1 class="text-2xl font-bold mb-4">Welcome to Phoenix LiveView ⚡</h1>
      <p>Counter: <%= @count %></p>
      <button phx-click="inc" class="btn btn-primary mt-4">Increment</button>
      <h2>Lets learn more</h2>
    </div>
    """
  end
end
