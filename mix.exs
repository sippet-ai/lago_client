defmodule LagoClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :lago_client,
      version: "1.0.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      description: description(),
      package: package(),
      source_url: "https://github.com/al/lago_client"
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
      {:req, "~> 0.5"},
      {:oapi_generator, "~> 0.4.0", only: :dev, runtime: false},
      {:ex_doc, "~> 0.40.1", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [
      "api.fetch": [
        "cmd curl -fsSL https://swagger.getlago.com/openapi.yaml -o priv/openapi/lago.yaml"
      ],
      "api.lago.gen": ["api.fetch", "api.gen lago priv/openapi/lago.yaml"]
    ]
  end

  defp description do
    "Elixir API client for Lago (generated from Lago OpenAPI spec)."
  end

  defp package do
    [
      licenses: ["AGPL-3.0-only"],
      links: %{
        "GitHub" => "https://github.com/YOUR_GH/lago_client",
        "Lago OpenAPI" => "https://github.com/getlago/lago-openapi",
        "Lago Swagger" => "https://swagger.getlago.com/"
      }
    ]
  end
end
