defmodule Lago do
  @moduledoc """
  Public client builder for Lago API operations.
  """

  alias Lago.Client

  @default_base_url "https://api.getlago.com/api/v1"

  @spec new(keyword) :: Req.Request.t()
  def new(opts \\ []) do
    base_url =
      opts[:base_url] ||
        Application.get_env(:lago_client, :base_url, @default_base_url)

    api_key =
      opts[:api_key] ||
        Application.get_env(:lago_client, :api_key) ||
        raise "Missing Lago API key"

    Client.new(base_url: base_url, api_key: api_key)
  end
end
