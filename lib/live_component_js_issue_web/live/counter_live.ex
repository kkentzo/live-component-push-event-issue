defmodule LiveComponentJsIssueWeb.Counter do
  use LiveComponentJsIssueWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, counter: 0)}
  end

  @impl true
  def handle_event("inc", _params, socket) do
    socket = socket |> assign(counter: socket.assigns.counter + 1)
    {:noreply, socket}
  end

  @impl true
  def handle_info({"ping", id}, socket) do
    {:noreply, push_event(socket, "ping", %{id: id})}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <div>counter=<%= @counter %></div>
    <button phx-click="inc">Inc</button>
    <%= live_component(@socket, LiveComponentJsIssueWeb.CounterComponent, id: "component-a", counter: @counter)%>
    <%= live_component(@socket, LiveComponentJsIssueWeb.CounterComponent, id: "component-b", counter: @counter)%>
    """
  end

end
