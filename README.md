# LagoClient

[![Hex.pm](https://img.shields.io/hexpm/v/lago_client.svg)](https://hex.pm/packages/lago_client)

Elixir client for the Lago API generated from Lago's OpenAPI spec.

## Installation

Add `lago_client` to your dependencies:

```elixir
def deps do
  [
    {:lago_client, "~> 1.0.0"}
  ]
end
```

## Generate From OpenAPI

Fetch the latest Lago OpenAPI file and regenerate the client:

```bash
mix api.lago.gen
```

This command:

1. Downloads `https://swagger.getlago.com/openapi.yaml` into `priv/openapi/lago.yaml`
2. Runs `mix api.gen lago priv/openapi/lago.yaml`
3. Outputs generated modules under `Lago.*` in `lib/lago/`

## Usage

```elixir
# Configure once (config/runtime.exs, env vars, etc.)
config :lago_client, :api_key, System.fetch_env!("LAGO_API_KEY")

# Use generated operations:
Lago.Customers.create_customer(
  %{customer: %{external_id: "cust_123", name: "ACME"}},
  []
)
```
