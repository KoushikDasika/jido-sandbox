defmodule JidoSandboxWeb.ErrorHTML do
  @moduledoc """
  Renders error pages as plain text.
  """

  def render(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
