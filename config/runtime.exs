import Config

# req_llm needs an OpenAI API key configured; for a local LLM any non-empty string works.
config :req_llm,
  receive_timeout: 300_000,
  stream_receive_timeout: 120_000,
  stream_pool_timeout: 120_000,
  stream_pool_protocols: [:http1],
  stream_pool_size: 1,
  stream_pool_count: 8,
  stream_pool_strategy: nil,
  metadata_timeout: 120_000,
  thinking_timeout: 300_000,
  image_receive_timeout: 120_000

config :jido_ai, model_aliases: [default: "unsloth/Qwen3.6-35B-A3B-MTP-GGUF:UD-Q4_K_XL"]
