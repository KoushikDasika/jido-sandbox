# jido-sandbox

Elixir 1.19 / OTP 28 mix project for experimenting with [Jido](https://jido.run) agentic workflows via Livebook, running against a local OpenAI-compatible LLM.

## Prerequisites

- Docker + Docker Compose
- Local LLM server on port **8080** (llama.cpp / LM Studio / Ollama with OpenAI-compat layer)

## Quickstart

```bash
# 1. (Optional) copy and edit environment overrides
cp .env.example .env

# 2. Start Livebook
rtk docker compose up -d

# 3. Tail logs to get the auth URL
rtk docker compose logs -f livebook
```

Open **http://localhost:4040** in your browser (Livebook uses port 8081 since 8080 is taken by the local LLM), enter password `jidosandbox123` (or your `LIVEBOOK_PASSWORD`).

### Open the intro notebook

1. In Livebook, navigate to **notebooks/intro.livemd**
2. Click **Runtime** → **Configure** → choose **Mix standalone**
3. Set root to `/data` → **Connect**
4. Deps are fetched on first connect (cached in Docker volumes)
5. Run cells top-to-bottom — the interactive form fires req_llm at your local LLM

## Verify Elixir/OTP version

```bash
rtk docker compose exec livebook elixir --version
# expect: Elixir 1.19.x / OTP 28
```

To run on Elixir 1.20 / OTP 29 instead, replace `image:` in compose.yaml with a custom build:

```yaml
# replace `image:` with:
build:
  dockerfile_inline: |
    FROM hexpm/elixir:1.20.1-erlang-29.0-ubuntu-noble-20260509.1
    RUN apt-get update && apt-get install -y ca-certificates inotify-tools && \
        mix local.hex --force && mix local.rebar --force && \
        mix escript.install hex livebook --force
    ENV PATH="/root/.mix/escripts:$PATH"
    CMD ["livebook", "server"]
# Also bump mix.exs elixir: "~> 1.20" and .tool-versions accordingly.
```

## Project structure

```
.
├── compose.yaml              # Livebook service definition
├── mix.exs                   # jido 2.3 / jido_ai 2.2 / req_llm 1.15 / kino 0.14
├── config/runtime.exs        # req_llm key config
├── lib/jido_sandbox/llm.ex   # JidoSandbox.LLM helper (model spec + ask/1)
└── notebooks/
    └── intro.livemd          # req_llm + Kino interactive demo
```

## Environment variables

| Variable | Default | Description |
|---|---|---|
| `LIVEBOOK_PASSWORD` | `jidosandbox123` | Livebook web password (min 12 chars) |
| `LLM_BASE_URL` | `http://localhost:8080/v1` | OpenAI-compatible endpoint |
| `LLM_MODEL` | `unsloth/Qwen3.6-35B-A3B-MTP-GGUF:UD-Q4_K_XL` | Model id from `/v1/models` |
| `OPENAI_API_KEY` | `local-dummy` | Ignored by local servers; needed for req_llm |

## Stopping

```bash
rtk docker compose down
```
