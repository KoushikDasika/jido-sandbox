defmodule JidoSandbox do
  @moduledoc """
  Documentation for `JidoSandbox`.
  """

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
