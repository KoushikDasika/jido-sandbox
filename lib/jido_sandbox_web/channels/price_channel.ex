defmodule JidoSandboxWeb.PriceChannel do
  @moduledoc """
  PriceChannel — server-push channel for broadcasting price updates.

  Receives events from agents and broadcasts to LiveView subscribers.
  """
  use JidoSandboxWeb, :channel

  @topic "prices:all"

  def topic, do: @topic

  def join(@topic, _payload, socket) do
    {:ok, socket}
  end

  def handle_info(%{event: "price_update", payload: payload} = _msg, socket) do
    broadcast(socket, "price_update", payload)
    {:noreply, socket}
  end
end
