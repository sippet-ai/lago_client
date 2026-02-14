defmodule Lago.Webhooks do
  @moduledoc """
  Provides API endpoint related to webhooks
  """

  @default_client Lago.Client

  @doc """
  Retrieve webhook public key

  This endpoint is used to retrieve the public key used to verify the webhooks signature
  """
  @spec fetch_public_key(opts :: keyword) ::
          {:ok, String.t()} | {:error, Lago.ApiErrorUnauthorized.t()}
  def fetch_public_key(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Lago.Webhooks, :fetch_public_key},
      url: "/webhooks/public_key",
      method: :get,
      response: [{200, :string}, {401, {Lago.ApiErrorUnauthorized, :t}}],
      opts: opts
    })
  end
end
