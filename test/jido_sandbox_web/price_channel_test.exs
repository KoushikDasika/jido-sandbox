defmodule JidoSandboxWeb.PriceChannelTest do
  require JidoSandbox.ChannelCase
  use JidoSandbox.ChannelCase

  test "join succeeds with any payload" do
    socket =
      Phoenix.ChannelTest.__socket__(
        JidoSandboxWeb.PriceChannel,
        "user:1",
        %{},
        JidoSandboxWeb.Endpoint,
        test_process: self()
      )

    {:ok, _assigns, _socket} =
      Phoenix.ChannelTest.join(socket, JidoSandboxWeb.PriceChannel, "prices:all", %{})
  end

  test "handle_info broadcasts price_update to topic subscribers" do
    payload = %{
      "source_name" => "Amazon",
      "price" => 29.99,
      "currency" => "USD",
      "product_name" => "Widget",
      "confidence_score" => 0.95,
      "timestamp" => "2026-06-21T10:00:00Z"
    }

    socket =
      Phoenix.ChannelTest.__socket__(
        JidoSandboxWeb.PriceChannel,
        "user:1",
        %{},
        JidoSandboxWeb.Endpoint,
        test_process: self()
      )

    {:ok, _assigns, joined_socket} =
      Phoenix.ChannelTest.subscribe_and_join(
        socket,
        JidoSandboxWeb.PriceChannel,
        "prices:all",
        %{}
      )

    JidoSandboxWeb.PriceChannel.handle_info(
      %{event: "price_update", payload: payload},
      joined_socket
    )

    assert_broadcast("price_update", ^payload)
  end
end
