defmodule Lago.Taxes do
  @moduledoc """
  Provides API endpoints related to taxes
  """

  @default_client Lago.Client

  @doc """
  Create a tax

  This endpoint creates a new tax representing a customizable tax rate applicable to either the organization or a specific customer.

  ## Request Body

  **Content Types**: `application/json`

  Tax creation payload
  """
  @spec create_tax(body :: Lago.TaxCreateInput.t(), opts :: keyword) ::
          {:ok, Lago.Tax.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_tax(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.Taxes, :create_tax},
      url: "/taxes",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.TaxCreateInput, :t}}],
      response: [
        {200, {Lago.Tax, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a tax

  This endpoint is used to delete a tax.
  """
  @spec destroy_tax(code :: String.t(), opts :: keyword) ::
          {:ok, Lago.Tax.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def destroy_tax(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {Lago.Taxes, :destroy_tax},
      url: "/taxes/#{code}",
      method: :delete,
      response: [
        {200, {Lago.Tax, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all taxes

  This endpoint retrieves all existing taxes representing a customizable tax rate applicable to either the organization or a specific customer.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.

  """
  @spec find_all_taxes(opts :: keyword) ::
          {:ok, Lago.TaxesPaginated.t()} | {:error, Lago.ApiErrorUnauthorized.t()}
  def find_all_taxes(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {Lago.Taxes, :find_all_taxes},
      url: "/taxes",
      method: :get,
      query: query,
      response: [{200, {Lago.TaxesPaginated, :t}}, {401, {Lago.ApiErrorUnauthorized, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieve a Tax

  This endpoint retrieves an existing tax representing a customizable tax rate applicable to either the organization or a specific customer. The tax is identified by its unique code.
  """
  @spec find_tax(code :: String.t(), opts :: keyword) ::
          {:ok, Lago.Tax.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_tax(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {Lago.Taxes, :find_tax},
      url: "/taxes/#{code}",
      method: :get,
      response: [
        {200, {Lago.Tax, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a tax

  This endpoint updates an existing tax representing a customizable tax rate applicable to either the organization or a specific customer.

  ## Request Body

  **Content Types**: `application/json`

  Tax update payload
  """
  @spec update_tax(code :: String.t(), body :: Lago.TaxUpdateInput.t(), opts :: keyword) ::
          {:ok, Lago.Tax.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def update_tax(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {Lago.Taxes, :update_tax},
      url: "/taxes/#{code}",
      body: body,
      method: :put,
      request: [{"application/json", {Lago.TaxUpdateInput, :t}}],
      response: [
        {200, {Lago.Tax, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
