import Config

config :jido_sandbox, JidoSandboxWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4001],
  secret_key_base: String.duplicate("b", 64),
  server: false

config :jido_sandbox, :start_browser_pool, false

config :logger, level: :warning
