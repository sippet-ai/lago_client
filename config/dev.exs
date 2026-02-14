import Config

config :oapi_generator,
  lago: [
    output: [
      base_module: Lago,
      location: "lib/lago",
      field_casing: :snake,
      default_client: Lago.Client
    ]
  ]
