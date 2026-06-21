defmodule JidoSandbox do
  @moduledoc """
  Jido Sandbox — Phoenix app hosting Jido agentic workflows.

  Serves as the runtime host for Jido agents, Phoenix Channels, and LiveView.
  """
  use Application

  @impl true
  def start(_type, _args) do
    children =
      [
        {Phoenix.PubSub, name: JidoSandbox.PubSub},
        JidoSandbox.Jido,
        JidoSandboxWeb.Endpoint
      ] ++ browser_pool_children()

    Supervisor.start_link(children, strategy: :one_for_one, name: JidoSandbox.Supervisor)
  end

  defp browser_pool_children do
    if Application.get_env(:jido_sandbox, :start_browser_pool, true) do
      [{Jido.Browser.Pool, name: :default, size: 2, headless: true, startup_timeout: 60_000}]
    else
      []
    end
  end
end
