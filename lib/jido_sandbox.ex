defmodule JidoSandbox do
  use Application

  @moduledoc """
  Documentation for `JidoSandbox`.
  """

  def start(_type, _args) do
    children = [
      {Jido.Browser.Pool, name: :default, size: 2, headless: true, startup_timeout: 60_000}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: JidoSandbox.Supervisor)
  end

  @doc """
  Hello world.

  ## Examples

      iex> JidoSandbox.hello()
      :world

  """
  def run do
    JidoSandbox.LLM.ask("Hello, how are you?")
  end
end
