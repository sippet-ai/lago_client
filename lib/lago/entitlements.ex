defmodule Lago.Entitlements do
  @moduledoc """
  Provides API endpoints related to entitlements
  """

  @default_client Lago.Client

  @doc """
  Create an entitlement

  This endpoint creates new entitlements by adding features to a plan. Note that all existing entitlements will be deleted and replaced by the ones provided. To add a new entitlement without removing the existing ones, use PATCH. The feature must exist and all privileges must be valid for the feature.

  ## Request Body

  **Content Types**: `application/json`

  Entitlement payload
  """
  @spec create_entitlement(
          code :: String.t(),
          body :: Lago.EntitlementUpdateInput.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.PlanEntitlements.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_entitlement(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {Lago.Entitlements, :create_entitlement},
      url: "/plans/#{code}/entitlements",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.EntitlementUpdateInput, :t}}],
      response: [
        {200, {Lago.PlanEntitlements, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an entitlement

  This endpoint deletes an existing entitlement by removing the feature from the plan.
  """
  @spec destroy_entitlement(code :: String.t(), feature_code :: String.t(), opts :: keyword) ::
          {:ok, Lago.PlanEntitlement.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def destroy_entitlement(code, feature_code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, feature_code: feature_code],
      call: {Lago.Entitlements, :destroy_entitlement},
      url: "/plans/#{code}/entitlements/#{feature_code}",
      method: :delete,
      response: [
        {200, {Lago.PlanEntitlement, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove an entitlement from a subscription

  This endpoint removes a specific feature entitlement from a subscription. The entitlement remains available from the plan.
  """
  @spec destroy_subscription_entitlement(
          external_id :: String.t(),
          feature_code :: String.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.SubscriptionEntitlement.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def destroy_subscription_entitlement(external_id, feature_code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id, feature_code: feature_code],
      call: {Lago.Entitlements, :destroy_subscription_entitlement},
      url: "/subscriptions/#{external_id}/entitlements/#{feature_code}",
      method: :delete,
      response: [
        {200, {Lago.SubscriptionEntitlement, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove a privilege from a subscription entitlement override

  This endpoint removes a specific privilege from a subscription entitlement. The privilege entitlement remains available from the plan.
  """
  @spec destroy_subscription_entitlement_privilege(
          external_id :: String.t(),
          feature_code :: String.t(),
          privilege_code :: String.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.SubscriptionEntitlement.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()}
  def destroy_subscription_entitlement_privilege(
        external_id,
        feature_code,
        privilege_code,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id, feature_code: feature_code, privilege_code: privilege_code],
      call: {Lago.Entitlements, :destroy_subscription_entitlement_privilege},
      url:
        "/subscriptions/#{external_id}/entitlements/#{feature_code}/privileges/#{privilege_code}",
      method: :delete,
      response: [
        {200, {Lago.SubscriptionEntitlement, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all entitlements

  This endpoint retrieves all entitlements for a specific plan.
  """
  @spec find_all_entitlements(code :: String.t(), opts :: keyword) ::
          {:ok, Lago.PlanEntitlements.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_all_entitlements(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {Lago.Entitlements, :find_all_entitlements},
      url: "/plans/#{code}/entitlements",
      method: :get,
      response: [
        {200, {Lago.PlanEntitlements, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all subscription entitlements

  This endpoint retrieves all entitlements for a specific subscription, including both plan entitlements and any subscription-specific overrides.
  """
  @spec find_all_subscription_entitlements(external_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.SubscriptionEntitlements.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_all_subscription_entitlements(external_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id],
      call: {Lago.Entitlements, :find_all_subscription_entitlements},
      url: "/subscriptions/#{external_id}/entitlements",
      method: :get,
      response: [
        {200, {Lago.SubscriptionEntitlements, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve an entitlement

  This endpoint retrieves a specific entitlement for a plan.
  """
  @spec find_entitlement(code :: String.t(), feature_code :: String.t(), opts :: keyword) ::
          {:ok, Lago.PlanEntitlement.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_entitlement(code, feature_code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, feature_code: feature_code],
      call: {Lago.Entitlements, :find_entitlement},
      url: "/plans/#{code}/entitlements/#{feature_code}",
      method: :get,
      response: [
        {200, {Lago.PlanEntitlement, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove a privilege from an entitlement

  This endpoint removes a specific privilege and its value from an entitlement. The privilege remains untouched on the original feature.
  """
  @spec remove_entitlement_privilege(
          code :: String.t(),
          feature_code :: String.t(),
          privilege_code :: String.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.PlanEntitlement.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def remove_entitlement_privilege(code, feature_code, privilege_code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, feature_code: feature_code, privilege_code: privilege_code],
      call: {Lago.Entitlements, :remove_entitlement_privilege},
      url: "/plans/#{code}/entitlements/#{feature_code}/privileges/#{privilege_code}",
      method: :delete,
      response: [
        {200, {Lago.PlanEntitlement, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Partial update of an entitlement

  This accepts a list of entitlements to update. If the feature isn't part of the plan yet, it's added with all the privileges from the payload. If the feature is already part of the plan, the privilege and values are updated or added. All privileges must be valid for the feature. All features  and privileges not part of the payload are left untouched. To remove privileges or features, use the DELETE endpoints.

  ## Request Body

  **Content Types**: `application/json`

  Entitlement payload
  """
  @spec update_entitlement(
          code :: String.t(),
          body :: Lago.EntitlementUpdateInput.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.PlanEntitlements.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def update_entitlement(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {Lago.Entitlements, :update_entitlement},
      url: "/plans/#{code}/entitlements",
      body: body,
      method: :patch,
      request: [{"application/json", {Lago.EntitlementUpdateInput, :t}}],
      response: [
        {200, {Lago.PlanEntitlements, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update subscription entitlements

  This accepts a list of entitlements to update. If the feature isn't part of the subscription yet, it's added with all the privileges from the payload. If the feature is already part of the subscription (via plan or via override), the privilege and values are updated or added. All privileges must be valid for the feature. All features  and privileges not part of the payload are left untouched. To remove privileges or features, use the DELETE endpoints.

  ## Request Body

  **Content Types**: `application/json`

  Subscription entitlements payload
  """
  @spec update_subscription_entitlements(
          external_id :: String.t(),
          body :: Lago.EntitlementUpdateInput.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.SubscriptionEntitlements.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def update_subscription_entitlements(external_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id, body: body],
      call: {Lago.Entitlements, :update_subscription_entitlements},
      url: "/subscriptions/#{external_id}/entitlements",
      body: body,
      method: :patch,
      request: [{"application/json", {Lago.EntitlementUpdateInput, :t}}],
      response: [
        {200, {Lago.SubscriptionEntitlements, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
