defmodule LiveComponentJsIssueWeb.CounterComponent do
  use LiveComponentJsIssueWeb, :live_component

  def mount(socket) do
    {:ok, socket |> assign(counter: 0)}
  end

  def update(%{id: id, counter: counter}, socket) do
    {:ok, socket |> assign(id: id, counter: counter) |> push_event("ping", %{id: id})}
  end

  def render(assigns) do
    ~L"""
    <div phx-hook="Counter" data-id="counter-<%= @id %>"><%= @id %>: <%= @counter %></div>
    """
  end

end
