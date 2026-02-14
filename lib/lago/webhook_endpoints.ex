defmodule Lago.WebhookEndpoints do
  @moduledoc """
  Provides API endpoints related to webhook endpoints
  """

  @default_client Lago.Client

  @doc """
  Create a webhook_endpoint

  This endpoint is used to create a webhook endpoint.

  ## Request Body

  **Content Types**: `application/json`

  Webhook Endpoint payload
  """
  @spec create_webhook_endpoint(body :: Lago.WebhookEndpointCreateInput.t(), opts :: keyword) ::
          {:ok, Lago.WebhookEndpoint.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_webhook_endpoint(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.WebhookEndpoints, :create_webhook_endpoint},
      url: "/webhook_endpoints",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.WebhookEndpointCreateInput, :t}}],
      response: [
        {200, {Lago.WebhookEndpoint, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a webhook endpoint

  This endpoint is used to delete an existing webhook endpoint.
  """
  @spec destroy_webhook_endpoint(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.WebhookEndpoint.t()}
          | {:error,
             Lago.ApiErrorNotAllowed.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()}
  def destroy_webhook_endpoint(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.WebhookEndpoints, :destroy_webhook_endpoint},
      url: "/webhook_endpoints/#{lago_id}",
      method: :delete,
      response: [
        {200, {Lago.WebhookEndpoint, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {405, {Lago.ApiErrorNotAllowed, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all webhook endpoints

  This endpoint is used to list all webhook endpoints.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.

  """
  @spec find_all_webhook_endpoints(opts :: keyword) ::
          {:ok, Lago.WebhookEndpointsPaginated.t()} | {:error, Lago.ApiErrorUnauthorized.t()}
  def find_all_webhook_endpoints(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {Lago.WebhookEndpoints, :find_all_webhook_endpoints},
      url: "/webhook_endpoints",
      method: :get,
      query: query,
      response: [
        {200, {Lago.WebhookEndpointsPaginated, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a webhook endpoint

  This endpoint is used to retrieve an existing webhook endpoint.
  """
  @spec find_webhook_endpoint(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.WebhookEndpoint.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_webhook_endpoint(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.WebhookEndpoints, :find_webhook_endpoint},
      url: "/webhook_endpoints/#{lago_id}",
      method: :get,
      response: [
        {200, {Lago.WebhookEndpoint, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a webhook endpoint

  This endpoint is used to update an existing webhook endpoint.

  ## Request Body

  **Content Types**: `application/json`

  Webhook Endpoint update payload
  """
  @spec update_webhook_endpoint(
          lago_id :: String.t(),
          body :: Lago.WebhookEndpointUpdateInput.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.WebhookEndpoint.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def update_webhook_endpoint(lago_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id, body: body],
      call: {Lago.WebhookEndpoints, :update_webhook_endpoint},
      url: "/webhook_endpoints/#{lago_id}",
      body: body,
      method: :put,
      request: [{"application/json", {Lago.WebhookEndpointUpdateInput, :t}}],
      response: [
        {200, {Lago.WebhookEndpoint, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
