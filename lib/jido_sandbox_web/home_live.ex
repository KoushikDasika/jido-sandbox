defmodule JidoSandboxWeb.HomeLive do
  @moduledoc """
  Home LiveView — landing page for the Jido Sandbox.
  """
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    <div class="container">
      <h1>Jido Sandbox</h1>
      <p>Phoenix app with Jido agentic workflows.</p>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
