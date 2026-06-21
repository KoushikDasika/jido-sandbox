import Config

# req_llm needs an OpenAI API key configured; for a local LLM any non-empty string works.
config :req_llm,
  # HTTP timeouts (all values in milliseconds)
  # Default response timeout (qwen3.5:0.8b reasoning on CPU runs ~120s for long prompts)
  receive_timeout: 300_000,
  # Streaming chunk timeout
  stream_receive_timeout: 120_000,
  # Streaming connection checkout timeout
  stream_pool_timeout: 120_000,
  # Default stream pool protocols
  stream_pool_protocols: [:http1],
  # HTTP/1 connections per stream pool worker
  stream_pool_size: 1,
  # Stream pool workers per origin
  stream_pool_count: 8,
  # Finch shard selection strategy
  stream_pool_strategy: nil,
  # Streaming metadata collection timeout
  metadata_timeout: 120_000,
  # Extended timeout for reasoning models
  thinking_timeout: 300_000,
  # Image generation timeout
  image_receive_timeout: 120_000

config :jido_ai, model_aliases: [default: "unsloth/Qwen3.6-35B-A3B-MTP-GGUF:UD-Q4_K_XL"]
