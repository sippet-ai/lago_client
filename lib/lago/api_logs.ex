defmodule Lago.ApiLogs do
  @moduledoc """
  Provides API endpoints related to api logs
  """

  @default_client Lago.Client

  @doc """
  List all api logs

  This endpoint retrieves all existing api logs that represent requests performed to Lago's API.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `from_date`: Filter api logs from a specific date.
    * `to_date`: Filter api logs up to a specific date.
    * `http_methods[]`: Filter results by HTTP methods
    * `http_statuses[]`: Filter results by HTTP status or by generic request status
    * `api_version`: Filter results by API version
    * `request_paths`: Filter results by the path of the request

  """
  @spec find_all_api_logs(opts :: keyword) ::
          {:ok, Lago.ApiLogsPaginated.t()} | {:error, Lago.ApiErrorUnauthorized.t()}
  def find_all_api_logs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :api_version,
        :from_date,
        :"http_methods[]",
        :"http_statuses[]",
        :page,
        :per_page,
        :request_paths,
        :to_date
      ])

    client.request(%{
      args: [],
      call: {Lago.ApiLogs, :find_all_api_logs},
      url: "/api_logs",
      method: :get,
      query: query,
      response: [{200, {Lago.ApiLogsPaginated, :t}}, {401, {Lago.ApiErrorUnauthorized, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieve an api log

  This endpoint retrieves an existing api log that represents a request made to the API. The api log is identified by its unique request_id.
  """
  @spec find_api_log(request_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.ApiLog.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_api_log(request_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [request_id: request_id],
      call: {Lago.ApiLogs, :find_api_log},
      url: "/api_logs/#{request_id}",
      method: :get,
      response: [
        {200, {Lago.ApiLog, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end
end
