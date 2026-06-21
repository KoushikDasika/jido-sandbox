defmodule JidoSandbox.ChannelCase do
  @moduledoc """
  This module defines the test case to be used by channel tests.
  """
  use ExUnit.CaseTemplate

  using do
    quote do
      import Phoenix.ChannelTest
      import JidoSandbox.ChannelCase

      @endpoint JidoSandboxWeb.Endpoint
    end
  end

  setup _tags do
    {:ok,
     socket:
       Phoenix.ChannelTest.__socket__(
         JidoSandboxWeb.PriceChannel,
         "user:1",
         %{},
         JidoSandboxWeb.Endpoint,
         test_process: self()
       )}
  end
end
