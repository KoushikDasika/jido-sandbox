defmodule JidoSandbox.LLM do
  @moduledoc """
  Thin wrapper around req_llm for calling a local OpenAI-compatible LLM.

  Reads environment variables (set in compose.yaml / .env):
    LLM_BASE_URL — e.g. "http://host.docker.internal:8080/v1"
    LLM_MODEL    — e.g. "unsloth/Qwen3.6-35B-A3B-MTP-GGUF:UD-Q4_K_XL"
    OPENAI_API_KEY — defaults to "local-dummy" (not validated by local server)
  """

  @default_base_url "http://localhost:8080/v1"
  @default_model "unsloth/Qwen3.6-35B-A3B-MTP-GGUF:UD-Q4_K_XL"

  @doc "Returns the req_llm inline model spec for the configured local LLM."
  def model do
    %{
      provider: :openai,
      id: model_id(),
      base_url: base_url()
    }
  end

  @doc "Ensures a (possibly dummy) API key is set for req_llm."
  def ensure_key do
    key = System.get_env("OPENAI_API_KEY") || "local-dummy"
    ReqLLM.put_key(:openai_api_key, key)
  end

  @doc """
  Send a plain-text prompt to the local LLM. Returns `{:ok, text}` or `{:error, reason}`.
  """
  def ask(prompt) when is_binary(prompt) do
    ensure_key()
    ReqLLM.generate_text(model(), prompt)
  end

  # --- private helpers ---

  defp base_url, do: System.get_env("LLM_BASE_URL") || @default_base_url
  defp model_id, do: System.get_env("LLM_MODEL") || @default_model
end
