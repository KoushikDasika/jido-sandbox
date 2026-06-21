defmodule JidoSandbox.MixProject do
  use Mix.Project

  def project do
    [
      app: :jido_sandbox,
      version: "0.1.0",
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jido, "~> 2.3"},
      {:jido_ai, "~> 2.2"},
      {:req_llm, "~> 1.15"},
      {:jido_browser, "~> 2.1"},
      {:light_cdp, "~> 0.2.1"},
      {:lightpanda_ex, "~> 0.1.0"},
      {:kino, "~> 0.14"}
    ]
  end
end
