defmodule Lago.Payments do
  @moduledoc """
  Provides API endpoints related to payments
  """

  @default_client Lago.Client

  @doc """
  Create a payment

  This endpoint is used to create a manual payment

  ## Request Body

  **Content Types**: `application/json`

  Payment payload
  """
  @spec create_payment(body :: Lago.PaymentCreateInput.t(), opts :: keyword) ::
          {:ok, Lago.Payment.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_payment(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.Payments, :create_payment},
      url: "/payments",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.PaymentCreateInput, :t}}],
      response: [
        {200, {Lago.Payment, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all customer's payments

  This endpoint is used to list all payments of a customer

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `invoice_id`: Unique identifier assigned to the invoice within the Lago application. This ID is exclusively created by Lago and serves as a unique identifier for the invoice's record within the Lago system.

  """
  @spec find_all_customer_payments(external_customer_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.PaymentsPaginated.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_all_customer_payments(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:invoice_id, :page, :per_page])

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {Lago.Payments, :find_all_customer_payments},
      url: "/customers/#{external_customer_id}/payments",
      method: :get,
      query: query,
      response: [
        {200, {Lago.PaymentsPaginated, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all payments

  This endpoint is used to list all payments

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `external_customer_id`: Unique identifier assigned to the customer in your application.
    * `invoice_id`: Unique identifier assigned to the invoice within the Lago application. This ID is exclusively created by Lago and serves as a unique identifier for the invoice's record within the Lago system.

  """
  @spec find_all_payments(opts :: keyword) ::
          {:ok, Lago.PaymentsPaginated.t()} | {:error, Lago.ApiErrorUnauthorized.t()}
  def find_all_payments(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:external_customer_id, :invoice_id, :page, :per_page])

    client.request(%{
      args: [],
      call: {Lago.Payments, :find_all_payments},
      url: "/payments",
      method: :get,
      query: query,
      response: [{200, {Lago.PaymentsPaginated, :t}}, {401, {Lago.ApiErrorUnauthorized, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieve a payment

  This endpoint retrieves a specific payment by its ID.
  """
  @spec find_payment(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.PaymentObject.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_payment(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.Payments, :find_payment},
      url: "/payments/#{lago_id}",
      method: :get,
      response: [
        {200, {Lago.PaymentObject, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end
end
