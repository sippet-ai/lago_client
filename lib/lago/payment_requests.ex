defmodule Lago.PaymentRequests do
  @moduledoc """
  Provides API endpoints related to payment requests
  """

  @default_client Lago.Client

  @doc """
  Create a payment request

  This endpoint is used to create a payment request to collect payments of overdue invoices of a given customer

  ## Request Body

  **Content Types**: `application/json`

  PaymentRequest payload
  """
  @spec create_payment_request(body :: Lago.PaymentRequestCreateInput.t(), opts :: keyword) ::
          {:ok, Lago.PaymentRequest.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_payment_request(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.PaymentRequests, :create_payment_request},
      url: "/payment_requests",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.PaymentRequestCreateInput, :t}}],
      response: [
        {200, {Lago.PaymentRequest, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all customer's payment requests

  This endpoint is used to list all existing payment requests of a customer.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `payment_status`: Filter by payment status. Possible values are `pending`, `failed` or `succeeded`.

  """
  @spec find_all_customer_payment_requests(external_customer_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.PaymentRequestsPaginated.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_all_customer_payment_requests(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :payment_status, :per_page])

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {Lago.PaymentRequests, :find_all_customer_payment_requests},
      url: "/customers/#{external_customer_id}/payment_requests",
      method: :get,
      query: query,
      response: [
        {200, {Lago.PaymentRequestsPaginated, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all payment requests

  This endpoint is used to list all existing payment requests.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `external_customer_id`: Unique identifier assigned to the customer in your application.
    * `payment_status`: Filter by payment status. Possible values are `pending`, `failed` or `succeeded`.

  """
  @spec find_all_payment_requests(opts :: keyword) ::
          {:ok, Lago.PaymentRequestsPaginated.t()} | {:error, Lago.ApiErrorUnauthorized.t()}
  def find_all_payment_requests(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:external_customer_id, :page, :payment_status, :per_page])

    client.request(%{
      args: [],
      call: {Lago.PaymentRequests, :find_all_payment_requests},
      url: "/payment_requests",
      method: :get,
      query: query,
      response: [
        {200, {Lago.PaymentRequestsPaginated, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a payment request

  This endpoint retrieves a specific payment request by its ID.
  """
  @spec find_payment_request(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.PaymentRequestObject.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_payment_request(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.PaymentRequests, :find_payment_request},
      url: "/payment_requests/#{lago_id}",
      method: :get,
      response: [
        {200, {Lago.PaymentRequestObject, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end
end
