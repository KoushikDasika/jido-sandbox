defmodule JidoSandboxWeb.PriceLiveTest do
  require JidoSandbox.ConnCase
  use JidoSandbox.ConnCase

  test "mount returns ok with empty prices", %{conn: conn} do
    {:ok, _view, _html} = live(conn, "/leaderboard")
  end

  test "render shows 'no prices' message when empty", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/leaderboard")
    assert html =~ "No prices scraped yet"
  end

  test "render shows table with prices when present", _ do
    assigns = %{
      prices: [
        %{
          "source_name" => "Amazon",
          "price" => 29.99,
          "currency" => "USD",
          "product_name" => "Widget",
          "confidence_score" => 0.95,
          "timestamp" => "2026-06-21T10:00:00Z"
        }
      ]
    }

    assigns = Map.merge(assigns, %{sort_column: :confidence_score, sort_direction: :desc})

    html =
     JidoSandboxWeb.PriceLive.render(assigns)
     |> Phoenix.HTML.html_escape()
     |> Phoenix.HTML.safe_to_string()

    assert html =~ "<table"
    assert html =~ "Source"
    assert html =~ "Amazon"
    assert html =~ "29.99"
  end
end
