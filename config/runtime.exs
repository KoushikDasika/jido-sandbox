import Config

# req_llm needs an OpenAI API key configured; for a local LLM any non-empty string works.
config :req_llm,
  openai_api_key: System.get_env("OPENAI_API_KEY") || "local-dummy"
