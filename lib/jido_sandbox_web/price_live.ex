defmodule JidoSandboxWeb.PriceLive do
  @moduledoc """
  Price LiveView — sortable leaderboard of scraped prices.
  """
  use JidoSandboxWeb, :live_view

  @topic "prices:all"

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Phoenix.PubSub.subscribe(JidoSandbox.PubSub, @topic)
    end

    socket =
      socket
      |> assign(:prices, [])
      |> assign(:sort_column, :confidence_score)
      |> assign(:sort_direction, :desc)

    {:ok, socket}
  end

  @impl true
  def handle_info(%{event: "price_update", payload: price} = _msg, socket) do
    prices = [price | socket.assigns.prices]
    {:noreply, assign(socket, :prices, prices)}
  end

  @impl true
  def handle_event("sort", %{"column" => column}, socket) do
    direction =
      if socket.assigns.sort_column == column && socket.assigns.sort_direction == :asc do
        :desc
      else
        :asc
      end

    {:noreply, assign(socket, sort_direction: direction, sort_column: column)}
  end

  @impl true
  def render(%{prices: []} = assigns) do
    ~H"""
    <div class="container" style="max-width: 1200px; margin: 0 auto; padding: 2rem;">
      <h1>Price Leaderboard</h1>
      <p>No prices scraped yet.</p>
    </div>
    """
  end

  def render(assigns) do
    ~H"""
    <div class="container" style="max-width: 1200px; margin: 0 auto; padding: 2rem;">
      <h1>Price Leaderboard</h1>
      <table class="leaderboard">
        <thead>
          <tr>
            <th class="sortable" phx-click="sort" phx-value-column="source_name">
              Source {direction_arrow(@sort_column, @sort_direction, :source_name)}
            </th>
            <th class="sortable" phx-click="sort" phx-value-column="price">
              Price {direction_arrow(@sort_column, @sort_direction, :price)}
            </th>
            <th class="sortable" phx-click="sort" phx-value-column="currency">
              Currency {direction_arrow(@sort_column, @sort_direction, :currency)}
            </th>
            <th class="sortable" phx-click="sort" phx-value-column="product_name">
              Product {direction_arrow(@sort_column, @sort_direction, :product_name)}
            </th>
            <th class="sortable" phx-click="sort" phx-value-column="confidence_score">
              Confidence {direction_arrow(@sort_column, @sort_direction, :confidence_score)}
            </th>
            <th class="sortable" phx-click="sort" phx-value-column="timestamp">
              Timestamp {direction_arrow(@sort_column, @sort_direction, :timestamp)}
            </th>
          </tr>
        </thead>
        <tbody>
          <%= for row <- @prices do %>
          <tr>
            <td><%= row["source_name"] %></td>
            <td><%= row["price"] %></td>
            <td><%= row["currency"] %></td>
            <td><%= row["product_name"] %></td>
            <td><%= row["confidence_score"] %></td>
            <td><%= row["timestamp"] %></td>
          </tr>
          <% end %>
        </tbody>
      </table>
    </div>
    """
  end

  defp direction_arrow(column, direction, target) do
    if column == target do
      " " <> direction_arrow_for(direction)
    else
      ""
    end
  end

  defp direction_arrow_for(:asc), do: "↑"
  defp direction_arrow_for(:desc), do: "↓"
end
