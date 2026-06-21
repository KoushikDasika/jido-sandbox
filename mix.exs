defmodule JidoSandbox.MixProject do
  use Mix.Project

  def project do
    [
      app: :jido_sandbox,
      version: "0.1.0",
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: Mix.compilers(),
      test_files: [test: "test/**/*_test.exs"]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {JidoSandbox, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Jido ecosystem
      {:jido, "~> 2.3"},
      {:jido_ai, "~> 2.2"},
      {:jido_browser, "~> 2.1"},
      {:req_llm, "~> 1.15"},
      {:light_cdp, "~> 0.2.1"},
      {:lightpanda_ex, "~> 0.1.0"},
      {:kino, "~> 0.14"},
      # Phoenix
      {:phoenix, "~> 1.8"},
      {:phoenix_html, "~> 4.0"},
      {:phoenix_live_view, "~> 1.2"},
      {:phoenix_live_reload, "~> 1.6", only: :dev},
      {:lazy_html, ">= 0.1.0", only: :test},
      {:bandit, "~> 1.6"}
    ]
  end
end
