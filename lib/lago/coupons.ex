defmodule Lago.Coupons do
  @moduledoc """
  Provides API endpoints related to coupons
  """

  @default_client Lago.Client

  @doc """
  Apply a coupon to a customer

  This endpoint is used to apply a specific coupon to a customer, before or during a subscription.

  ## Request Body

  **Content Types**: `application/json`

  Apply coupon payload
  """
  @spec apply_coupon(body :: Lago.AppliedCouponInput.t(), opts :: keyword) ::
          {:ok, Lago.AppliedCoupon.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def apply_coupon(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.Coupons, :apply_coupon},
      url: "/applied_coupons",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.AppliedCouponInput, :t}}],
      response: [
        {200, {Lago.AppliedCoupon, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a coupon

  This endpoint is used to create a coupon that can be then attached to a customer to create a discount.

  ## Request Body

  **Content Types**: `application/json`

  Coupon payload
  """
  @spec create_coupon(body :: Lago.CouponCreateInput.t(), opts :: keyword) ::
          {:ok, Lago.Coupon.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_coupon(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.Coupons, :create_coupon},
      url: "/coupons",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.CouponCreateInput, :t}}],
      response: [
        {200, {Lago.Coupon, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an applied coupon

  This endpoint is used to delete a specific coupon that has been applied to a customer.
  """
  @spec delete_applied_coupon(
          external_customer_id :: String.t(),
          applied_coupon_id :: String.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.AppliedCoupon.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def delete_applied_coupon(external_customer_id, applied_coupon_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_customer_id: external_customer_id, applied_coupon_id: applied_coupon_id],
      call: {Lago.Coupons, :delete_applied_coupon},
      url: "/customers/#{external_customer_id}/applied_coupons/#{applied_coupon_id}",
      method: :delete,
      response: [
        {200, {Lago.AppliedCoupon, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a coupon

  This endpoint is used to delete a coupon.
  """
  @spec destroy_coupon(code :: String.t(), opts :: keyword) ::
          {:ok, Lago.Coupon.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def destroy_coupon(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {Lago.Coupons, :destroy_coupon},
      url: "/coupons/#{code}",
      method: :delete,
      response: [
        {200, {Lago.Coupon, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all applied coupons

  This endpoint is used to list all applied coupons. You can filter by coupon status and by customer.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `status`: The status of the coupon. Can be either `active` or `terminated`.
    * `external_customer_id`: The customer external unique identifier (provided by your own application)
    * `coupon_code[]`: The code of the coupon applied to the customer. Use it to filter applied coupons by their code.

  """
  @spec find_all_applied_coupons(opts :: keyword) ::
          {:ok, Lago.AppliedCouponsPaginated.t()} | {:error, Lago.ApiErrorUnauthorized.t()}
  def find_all_applied_coupons(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"coupon_code[]", :external_customer_id, :page, :per_page, :status])

    client.request(%{
      args: [],
      call: {Lago.Coupons, :find_all_applied_coupons},
      url: "/applied_coupons",
      method: :get,
      query: query,
      response: [
        {200, {Lago.AppliedCouponsPaginated, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all coupons

  This endpoint is used to list all existing coupons.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.

  """
  @spec find_all_coupons(opts :: keyword) ::
          {:ok, Lago.CouponsPaginated.t()} | {:error, Lago.ApiErrorUnauthorized.t()}
  def find_all_coupons(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {Lago.Coupons, :find_all_coupons},
      url: "/coupons",
      method: :get,
      query: query,
      response: [{200, {Lago.CouponsPaginated, :t}}, {401, {Lago.ApiErrorUnauthorized, :t}}],
      opts: opts
    })
  end

  @doc """
  List all customer's applied coupons

  This endpoint is used to list all applied coupons for a customer.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `status`: The status of the coupon. Can be either `active` or `terminated`.
    * `coupon_code[]`: The code of the coupon applied to the customer. Use it to filter applied coupons by their code.

  """
  @spec find_all_customer_applied_coupons(external_customer_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.AppliedCouponsPaginated.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_all_customer_applied_coupons(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"coupon_code[]", :page, :per_page, :status])

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {Lago.Coupons, :find_all_customer_applied_coupons},
      url: "/customers/#{external_customer_id}/applied_coupons",
      method: :get,
      query: query,
      response: [
        {200, {Lago.AppliedCouponsPaginated, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a coupon

  This endpoint is used to retrieve a specific coupon.
  """
  @spec find_coupon(code :: String.t(), opts :: keyword) ::
          {:ok, Lago.Coupon.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_coupon(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {Lago.Coupons, :find_coupon},
      url: "/coupons/#{code}",
      method: :get,
      response: [
        {200, {Lago.Coupon, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a coupon

  This endpoint is used to update a coupon that can be then attached to a customer to create a discount.

  ## Request Body

  **Content Types**: `application/json`

  Coupon payload
  """
  @spec update_coupon(code :: String.t(), body :: Lago.CouponUpdateInput.t(), opts :: keyword) ::
          {:ok, Lago.Coupon.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def update_coupon(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {Lago.Coupons, :update_coupon},
      url: "/coupons/#{code}",
      body: body,
      method: :put,
      request: [{"application/json", {Lago.CouponUpdateInput, :t}}],
      response: [
        {200, {Lago.Coupon, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
