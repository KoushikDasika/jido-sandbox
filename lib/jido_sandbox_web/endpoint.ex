defmodule JidoSandboxWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :jido_sandbox

  @session_options [
    store: :cookie,
    key: "_jido_sandbox_key",
    signing_salt: "jidosandbox-session-salt",
    same_site: "Lax"
  ]

  socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [session: @session_options]]

  socket "/c", JidoSandboxWeb.Socket,
    websocket: [connect_info: [session: @session_options]],
    join_timeout: 30_000

  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.Static,
    at: "/static",
    from: {:jido_sandbox, "priv/static"},
    gzip: false,
    only: ~w(.css .js .png .ico .svg)

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["text/*", "application/json"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug JidoSandboxWeb.Router
end
