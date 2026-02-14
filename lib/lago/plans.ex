defmodule Lago.Plans do
  @moduledoc """
  Provides API endpoints related to plans
  """

  @default_client Lago.Client

  @doc """
  Create a plan

  This endpoint creates a plan with subscription and usage-based charges. It supports flexible billing cadence (in-advance or in-arrears) and allows for both recurring and metered charges.

  ## Request Body

  **Content Types**: `application/json`

  Plan payload
  """
  @spec create_plan(body :: Lago.PlanCreateInput.t(), opts :: keyword) ::
          {:ok, Lago.Plan.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_plan(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.Plans, :create_plan},
      url: "/plans",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.PlanCreateInput, :t}}],
      response: [
        {200, {Lago.Plan, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete all plan metadata

  This endpoint removes all metadata from a plan.
  """
  @spec delete_all_plan_metadata(code :: String.t(), opts :: keyword) ::
          {:ok, Lago.PlanMetadataResponse.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def delete_all_plan_metadata(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {Lago.Plans, :delete_all_plan_metadata},
      url: "/plans/#{code}/metadata",
      method: :delete,
      response: [
        {200, {Lago.PlanMetadataResponse, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a metadata key

  This endpoint removes a single metadata key from a plan.
  """
  @spec delete_plan_metadata_key(code :: String.t(), key :: String.t(), opts :: keyword) ::
          {:ok, Lago.PlanMetadataResponse.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def delete_plan_metadata_key(code, key, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, key: key],
      call: {Lago.Plans, :delete_plan_metadata_key},
      url: "/plans/#{code}/metadata/#{key}",
      method: :delete,
      response: [
        {200, {Lago.PlanMetadataResponse, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a plan

  This endpoint deletes a specific plan. Note that this plan could be associated with active subscriptions.
  """
  @spec destroy_plan(code :: String.t(), opts :: keyword) ::
          {:ok, Lago.Plan.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def destroy_plan(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {Lago.Plans, :destroy_plan},
      url: "/plans/#{code}",
      method: :delete,
      response: [
        {200, {Lago.Plan, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all plans

  This endpoint retrieves all existing plans.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.

  """
  @spec find_all_plans(opts :: keyword) ::
          {:ok, Lago.PlansPaginated.t()} | {:error, Lago.ApiErrorUnauthorized.t()}
  def find_all_plans(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {Lago.Plans, :find_all_plans},
      url: "/plans",
      method: :get,
      query: query,
      response: [{200, {Lago.PlansPaginated, :t}}, {401, {Lago.ApiErrorUnauthorized, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieve a plan

  This endpoint retrieves a specific plan.
  """
  @spec find_plan(code :: String.t(), opts :: keyword) ::
          {:ok, Lago.Plan.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_plan(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {Lago.Plans, :find_plan},
      url: "/plans/#{code}",
      method: :get,
      response: [
        {200, {Lago.Plan, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Merge plan metadata

  This endpoint merges the provided metadata with existing metadata on the plan.
  Existing keys not in the request are preserved. New keys are added, existing keys are updated.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec merge_plan_metadata(
          code :: String.t(),
          body :: Lago.PlanMetadataResponse.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.PlanMetadataResponse.t()}
          | {:error,
             Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def merge_plan_metadata(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {Lago.Plans, :merge_plan_metadata},
      url: "/plans/#{code}/metadata",
      body: body,
      method: :patch,
      request: [{"application/json", {Lago.PlanMetadataResponse, :t}}],
      response: [
        {200, {Lago.PlanMetadataResponse, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Replace plan metadata

  This endpoint replaces all existing metadata on a plan with the provided key-value pairs.
  Any existing metadata keys not included in the request will be removed.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec replace_plan_metadata(
          code :: String.t(),
          body :: Lago.PlanMetadataResponse.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.PlanMetadataResponse.t()}
          | {:error,
             Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def replace_plan_metadata(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {Lago.Plans, :replace_plan_metadata},
      url: "/plans/#{code}/metadata",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.PlanMetadataResponse, :t}}],
      response: [
        {200, {Lago.PlanMetadataResponse, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a plan

  This endpoint updates a specific plan with subscription and usage-based charges. It supports flexible billing cadence (in-advance or in-arrears) and allows for both recurring and metered charges.

  ## Request Body

  **Content Types**: `application/json`

  Plan payload
  """
  @spec update_plan(code :: String.t(), body :: Lago.PlanUpdateInput.t(), opts :: keyword) ::
          {:ok, Lago.Plan.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def update_plan(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {Lago.Plans, :update_plan},
      url: "/plans/#{code}",
      body: body,
      method: :put,
      request: [{"application/json", {Lago.PlanUpdateInput, :t}}],
      response: [
        {200, {Lago.Plan, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
