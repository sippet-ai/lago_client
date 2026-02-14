defmodule Lago.Client do
  @moduledoc """
  Default HTTP client used by generated Lago operation modules.
  """

  @default_base_url "https://api.getlago.com/api/v1"

  @type request_state :: %{
          optional(:args) => keyword,
          optional(:url) => String.t(),
          optional(:body) => map | list | nil,
          optional(:method) => atom,
          optional(:query) => keyword,
          optional(:opts) => keyword
        }

  @spec new(keyword) :: Req.Request.t()
  def new(opts \\ []) do
    base_url = Keyword.get(opts, :base_url, @default_base_url)
    api_key = Keyword.fetch!(opts, :api_key)
    req_opts = Keyword.get(opts, :req, [])

    Req.new(
      base_url: base_url,
      headers: [{"authorization", "Bearer #{api_key}"}],
      decode_body: true
    )
    |> Req.merge(req_opts)
  end

  @spec request(request_state) :: {:ok, term} | {:error, term}
  def request(operation_state) when is_map(operation_state) do
    opts = Map.get(operation_state, :opts, [])
    request = Keyword.get(opts, :request, default_request(opts))

    method = Map.get(operation_state, :method, :get)
    path = Map.get(operation_state, :url, "/")
    query = Map.get(operation_state, :query, [])
    body = Map.get(operation_state, :body)

    req_options =
      [method: method, url: path, params: query]
      |> maybe_put_body(body)

    case Req.request(request, req_options) do
      {:ok, %Req.Response{status: status, body: response_body}}
      when status >= 200 and status < 300 ->
        {:ok, response_body}

      {:ok, %Req.Response{} = response} ->
        {:error, response}

      {:error, reason} ->
        {:error, reason}
    end
  end

  def request(_), do: {:error, :invalid_request}

  defp default_request(opts) do
    api_key =
      Keyword.get(opts, :api_key) ||
        Application.get_env(:lago_client, :api_key) ||
        raise "Missing Lago API key"

    base_url =
      Keyword.get(
        opts,
        :base_url,
        Application.get_env(:lago_client, :base_url, @default_base_url)
      )

    new(base_url: base_url, api_key: api_key)
  end

  defp maybe_put_body(options, nil), do: options
  defp maybe_put_body(options, body), do: Keyword.put(options, :json, body)
end
