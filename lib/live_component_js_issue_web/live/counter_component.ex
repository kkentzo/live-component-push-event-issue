defmodule LiveComponentJsIssueWeb.CounterComponent do
  use LiveComponentJsIssueWeb, :live_view

  @impl true
  def mount(_params, %{"counter" => counter} = session, %Phoenix.LiveView.Socket{id: id} = socket) do
    if connected?(socket) do
      send(socket.parent_pid, {:child_pid, self()})
    end
    {:ok, socket |> assign(counter: counter, id: id)}
  end

  @impl true
  def handle_info("inc", socket) do
    {:noreply, assign(socket, counter: socket.assigns.counter + 1) |> push_event("ping", %{id: socket.assigns.id})}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <div id="dom-id-<%= @id %>" phx-hook="Counter" data-id="counter-<%= @id %>"><%= @id %>: <%= @counter %></div>
    """
  end

end
