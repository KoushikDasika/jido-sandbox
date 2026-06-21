defmodule JidoSandboxWeb.Router do
  use Phoenix.Router, helpers: false

  import Plug.Conn
  import Phoenix.Controller
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {JidoSandboxWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", JidoSandboxWeb do
    pipe_through :browser

    live_session :default do
      live "/", HomeLive
      live "/leaderboard", PriceLive
    end
  end
end
