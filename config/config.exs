import Config

config :jido_sandbox, JidoSandboxWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [formats: [html: JidoSandboxWeb.ErrorHTML], layout: false],
  pubsub_server: JidoSandbox.PubSub,
  live_view: [signing_salt: "jidosandbox-salt"]

config :phoenix, :json_library, JSON

config :jido_sandbox, :target_sites, [
  %{name: "Amazon US", url: "https://www.amazon.com"},
  %{name: "Newegg", url: "https://www.newegg.com"},
  %{name: "B&H Photo", url: "https://www.bhphotovideo.com"},
  %{name: "Best Buy", url: "https://www.bestbuy.com"}
]

import_config "#{config_env()}.exs"
