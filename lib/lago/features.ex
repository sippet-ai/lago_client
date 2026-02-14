defmodule Lago.Features do
  @moduledoc """
  Provides API endpoints related to features
  """

  @default_client Lago.Client

  @doc """
  Create a feature

  This endpoint creates a new feature representing an entitlement component of your application.

  ## Request Body

  **Content Types**: `application/json`

  Feature payload
  """
  @spec create_feature(body :: Lago.FeatureCreateInput.t(), opts :: keyword) ::
          {:ok, Lago.Feature.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_feature(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.Features, :create_feature},
      url: "/features",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.FeatureCreateInput, :t}}],
      response: [
        {200, {Lago.Feature, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a privilege. Deleting a privilege removes it from all plans and subscriptions.

  Delete privilege from feature. Deleting a privilege removes it from all plans and subscriptions.
  """
  @spec delete_feature_privilege(
          code :: String.t(),
          privilege_code :: String.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.Feature.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def delete_feature_privilege(code, privilege_code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, privilege_code: privilege_code],
      call: {Lago.Features, :delete_feature_privilege},
      url: "/features/#{code}/privileges/#{privilege_code}",
      method: :delete,
      response: [
        {200, {Lago.Feature, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a feature

  This endpoint deletes an existing feature representing an entitlement component of your application. Deleting a feature will remove it from all plans and subscriptions.
  """
  @spec destroy_feature(code :: String.t(), opts :: keyword) ::
          {:ok, Lago.Feature.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def destroy_feature(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {Lago.Features, :destroy_feature},
      url: "/features/#{code}",
      method: :delete,
      response: [
        {200, {Lago.Feature, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all features

  This endpoint retrieves all existing features that represent entitlement components of your application.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `search_term`: Search in name, code and description.

  """
  @spec find_all_features(opts :: keyword) ::
          {:ok, Lago.FeaturesPaginated.t()} | {:error, Lago.ApiErrorUnauthorized.t()}
  def find_all_features(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :search_term])

    client.request(%{
      args: [],
      call: {Lago.Features, :find_all_features},
      url: "/features",
      method: :get,
      query: query,
      response: [{200, {Lago.FeaturesPaginated, :t}}, {401, {Lago.ApiErrorUnauthorized, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieve a feature

  This endpoint retrieves an existing feature that represents an entitlement component of your application. The feature is identified by its unique code.
  """
  @spec find_feature(code :: String.t(), opts :: keyword) ::
          {:ok, Lago.Feature.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_feature(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {Lago.Features, :find_feature},
      url: "/features/#{code}",
      method: :get,
      response: [
        {200, {Lago.Feature, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a feature

  This endpoint updates an existing feature representing an entitlement component of your application.

  ## Request Body

  **Content Types**: `application/json`

  Feature payload
  """
  @spec update_feature(code :: String.t(), body :: Lago.FeatureUpdateInput.t(), opts :: keyword) ::
          {:ok, Lago.Feature.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def update_feature(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {Lago.Features, :update_feature},
      url: "/features/#{code}",
      body: body,
      method: :put,
      request: [{"application/json", {Lago.FeatureUpdateInput, :t}}],
      response: [
        {200, {Lago.Feature, :t}},
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
