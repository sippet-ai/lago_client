defmodule Lago.AddOns do
  @moduledoc """
  Provides API endpoints related to add ons
  """

  @default_client Lago.Client

  @doc """
  Create an add-on

  This endpoint is used to create an add-on that can be then attached to a one-off invoice.

  ## Request Body

  **Content Types**: `application/json`

  Add-on payload
  """
  @spec create_add_on(body :: Lago.AddOnCreateInput.t(), opts :: keyword) ::
          {:ok, Lago.AddOn.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_add_on(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.AddOns, :create_add_on},
      url: "/add_ons",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.AddOnCreateInput, :t}}],
      response: [
        {200, {Lago.AddOn, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an add-on

  This endpoint is used to delete an existing add-on.
  """
  @spec destroy_add_on(code :: String.t(), opts :: keyword) ::
          {:ok, Lago.AddOn.t()}
          | {:error,
             Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()}
  def destroy_add_on(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {Lago.AddOns, :destroy_add_on},
      url: "/add_ons/#{code}",
      method: :delete,
      response: [
        {200, {Lago.AddOn, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve an add-on

  This endpoint is used to retrieve a specific add-on.
  """
  @spec find_add_on(code :: String.t(), opts :: keyword) ::
          {:ok, Lago.AddOn.t()}
          | {:error,
             Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()}
  def find_add_on(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {Lago.AddOns, :find_add_on},
      url: "/add_ons/#{code}",
      method: :get,
      response: [
        {200, {Lago.AddOn, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all add-ons

  This endpoint is used to list all existing add-ons.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.

  """
  @spec find_all_add_ons(opts :: keyword) ::
          {:ok, Lago.AddOnsPaginated.t()}
          | {:error, Lago.ApiErrorForbidden.t() | Lago.ApiErrorUnauthorized.t()}
  def find_all_add_ons(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {Lago.AddOns, :find_all_add_ons},
      url: "/add_ons",
      method: :get,
      query: query,
      response: [
        {200, {Lago.AddOnsPaginated, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update an add-on

  This endpoint is used to update an existing add-on.

  ## Request Body

  **Content Types**: `application/json`

  Add-on payload
  """
  @spec update_add_on(code :: String.t(), body :: Lago.AddOnUpdateInput.t(), opts :: keyword) ::
          {:ok, Lago.AddOn.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def update_add_on(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {Lago.AddOns, :update_add_on},
      url: "/add_ons/#{code}",
      body: body,
      method: :put,
      request: [{"application/json", {Lago.AddOnUpdateInput, :t}}],
      response: [
        {200, {Lago.AddOn, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
