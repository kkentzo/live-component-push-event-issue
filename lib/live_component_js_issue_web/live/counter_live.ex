defmodule LiveComponentJsIssueWeb.Counter do
  use LiveComponentJsIssueWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, counter: 0, children: [])}
  end

  @impl true
  def handle_info({:child_pid, pid}, socket) do
    {:noreply, assign(socket, children: [pid | socket.assigns.children])}
  end

  @impl true
  def handle_event("inc", _params, socket) do
    socket = socket |> assign(counter: socket.assigns.counter + 1)
    Enum.each(socket.assigns.children, fn pid -> send(pid, "inc") end)
    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <div>counter=<%= @counter %></div>
    <button phx-click="inc">Inc</button>
    <%= live_render(@socket, LiveComponentJsIssueWeb.CounterComponent, id: "component-a", session: %{"counter" => @counter})%>
    <%= live_render(@socket, LiveComponentJsIssueWeb.CounterComponent, id: "component-b", session: %{"counter" => @counter})%>
    """
  end

end
