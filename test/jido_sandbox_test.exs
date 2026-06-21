defmodule JidoSandboxTest do
  use ExUnit.Case

  doctest JidoSandbox

  test "JidoSandbox module exists" do
    assert is_atom(JidoSandbox)
    assert function_exported?(JidoSandbox, :start, 2)
  end

  test "JidoSandboxWeb modules exist" do
    assert is_atom(JidoSandboxWeb.Endpoint)
    assert is_atom(JidoSandboxWeb.Router)
    assert is_atom(JidoSandboxWeb.HomeLive)
    assert is_atom(JidoSandboxWeb.Layouts)
  end

  test "JidoSandbox.Jido module exists" do
    assert is_atom(JidoSandbox.Jido)
  end
end
