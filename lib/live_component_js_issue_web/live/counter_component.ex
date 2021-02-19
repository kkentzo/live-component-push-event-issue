defmodule LiveComponentJsIssueWeb.CounterComponent do
  use LiveComponentJsIssueWeb, :live_component

  def mount(socket) do
    {:ok, socket |> assign(counter: 0)}
  end

  def update(%{id: id, counter: counter}, socket) do
    send(self(), {"ping", id})
    {:ok, socket |> assign(id: id, counter: counter)}
  end

  def render(assigns) do
    ~L"""
    <div id="dom-id-<%= @id %>" phx-hook="Counter" data-id="counter-<%= @id %>"><%= @id %>: <%= @counter %></div>
    """
  end

end
