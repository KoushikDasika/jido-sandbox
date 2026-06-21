defmodule JidoSandbox.Jido do
  @moduledoc """
  Jido instance for JidoSandbox. Added to the application supervision tree.

  Manages agent lifecycle, worker pools, and runtime store.
  """
  use Jido, otp_app: :jido_sandbox
end
