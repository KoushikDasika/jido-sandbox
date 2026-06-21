defmodule JidoSandboxWeb.Layouts do
  @moduledoc """
  Root and app layout function components.
  """
  use Phoenix.Component

  def root(assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Jido Sandbox</title>
      </head>
      <body>
        {@inner_content}
      </body>
    </html>
    """
  end
end
