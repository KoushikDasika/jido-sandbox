defmodule JidoSandboxWeb do
  @moduledoc """
  The web layer for JidoSandbox.

  Use these functions to import helpers in controllers, live views, and views:

      use JidoSandboxWeb, :controller
      use JidoSandboxWeb, :live_view
      use JidoSandboxWeb, :html

  See the Phoenix docs for more detail: https://hexdocs.pm/phoenix
  """

  def static_paths, do: ~w()

  def router do
    quote do
      use Phoenix.Router, helpers: false
      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
    end
  end

  def controller do
    quote do
      use Phoenix.Controller,
        formats: [:html, :json],
        layouts: [html: JidoSandboxWeb.Layouts]

      import Plug.Conn
    end
  end

  def live_view do
    quote do
      use Phoenix.LiveView
      use Phoenix.Component
      unquote(html_helpers())
    end
  end

  def live_component do
    quote do
      use Phoenix.LiveComponent
      unquote(html_helpers())
    end
  end

  def html do
    quote do
      use Phoenix.Component
      import Phoenix.Controller, only: [get_csrf_token: 0]
    end
  end

  defp html_helpers do
    quote do
      use Phoenix.Component
      import Phoenix.Controller, only: [get_csrf_token: 0]
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
