defmodule JidoSandbox.ConnCase do
  @moduledoc """
  This module defines the test case to be used by live views that require
  basic HTTP connection setup.
  """
  use ExUnit.CaseTemplate

  using do
    quote do
      import Phoenix.ConnTest
      import Phoenix.LiveViewTest
      import JidoSandbox.ConnCase

      @endpoint JidoSandboxWeb.Endpoint
    end
  end

  setup _tags do
    conn = Phoenix.ConnTest.build_conn()
    {:ok, conn: conn}
  end
end
