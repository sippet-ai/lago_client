defmodule Lago.BillingEntities do
  @moduledoc """
  Provides API endpoints related to billing entities
  """

  @default_client Lago.Client

  @doc """
  Create a billing entity

  This endpoint is used to create a new billing entity

  ## Request Body

  **Content Types**: `application/json`

  The billing entity payload
  """
  @spec create_billing_entity(body :: Lago.BillingEntityCreateInput.t(), opts :: keyword) ::
          {:ok, Lago.BillingEntityObject.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_billing_entity(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.BillingEntities, :create_billing_entity},
      url: "/billing_entities",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.BillingEntityCreateInput, :t}}],
      response: [
        {200, {Lago.BillingEntityObject, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @type get_billing_entity_200_json_resp :: %{
          billing_entity: Lago.BillingEntityObjectExtended.t()
        }

  @doc """
  Retrieve a billing entity

  This endpoint returns a specific billing entity by its code
  """
  @spec get_billing_entity(code :: String.t(), opts :: keyword) ::
          {:ok, Lago.BillingEntities.get_billing_entity_200_json_resp()}
          | {:error,
             Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def get_billing_entity(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {Lago.BillingEntities, :get_billing_entity},
      url: "/billing_entities/#{code}",
      method: :get,
      response: [
        {200, {Lago.BillingEntities, :get_billing_entity_200_json_resp}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @type list_billing_entities_200_json_resp :: %{billing_entities: [Lago.BillingEntityObject.t()]}

  @doc """
  List all billing entities

  This endpoint returns a list of all billing entities in the organization
  """
  @spec list_billing_entities(opts :: keyword) ::
          {:ok, Lago.BillingEntities.list_billing_entities_200_json_resp()}
          | {:error, Lago.ApiErrorUnauthorized.t() | Lago.ApiErrorUnprocessableEntity.t()}
  def list_billing_entities(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Lago.BillingEntities, :list_billing_entities},
      url: "/billing_entities",
      method: :get,
      response: [
        {200, {Lago.BillingEntities, :list_billing_entities_200_json_resp}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a billing entity

  This endpoint is used to update an existing billing entity

  ## Request Body

  **Content Types**: `application/json`

  The billing entity update payload
  """
  @spec update_billing_entity(
          code :: String.t(),
          body :: Lago.BillingEntityUpdateInput.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.BillingEntityObjectExtended.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def update_billing_entity(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {Lago.BillingEntities, :update_billing_entity},
      url: "/billing_entities/#{code}",
      body: body,
      method: :put,
      request: [{"application/json", {Lago.BillingEntityUpdateInput, :t}}],
      response: [
        {200, {Lago.BillingEntityObjectExtended, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_billing_entity_200_json_resp) do
    [billing_entity: {Lago.BillingEntityObjectExtended, :t}]
  end

  def __fields__(:list_billing_entities_200_json_resp) do
    [billing_entities: [{Lago.BillingEntityObject, :t}]]
  end
end
