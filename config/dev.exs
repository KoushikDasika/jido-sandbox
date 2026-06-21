import Config

config :jido_sandbox, JidoSandboxWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 4000],
  secret_key_base: String.duplicate("a", 64),
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  server: true,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif)$},
      ~r{lib/jido_sandbox_web/.*(ex)$}
    ]
  ]

config :phoenix, :live_view, signing_salt: "jidosandbox-dev-salt"

config :logger, :default_formatter,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]
