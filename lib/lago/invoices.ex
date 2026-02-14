defmodule Lago.Invoices do
  @moduledoc """
  Provides API endpoints related to invoices
  """

  @default_client Lago.Client

  @doc """
  Create a one-off invoice

  This endpoint is used for issuing a one-off invoice.

  ## Request Body

  **Content Types**: `application/json`

  Invoice payload
  """
  @spec create_invoice(body :: Lago.InvoiceOneOffCreateInput.t(), opts :: keyword) ::
          {:ok, Lago.Invoice.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_invoice(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.Invoices, :create_invoice},
      url: "/invoices",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.InvoiceOneOffCreateInput, :t}}],
      response: [
        {200, {Lago.Invoice, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Download an invoice PDF

  This endpoint is used for downloading a specific invoice PDF document.
  """
  @spec download_invoice(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.Invoice.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def download_invoice(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.Invoices, :download_invoice},
      url: "/invoices/#{lago_id}/download",
      method: :post,
      response: [
        {200, {Lago.Invoice, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Finalize a draft invoice

  This endpoint is used for finalizing a draft invoice.
  """
  @spec finalize_invoice(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.Invoice.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def finalize_invoice(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.Invoices, :finalize_invoice},
      url: "/invoices/#{lago_id}/finalize",
      method: :put,
      response: [
        {200, {Lago.Invoice, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all customer's invoices

  This endpoint is used for retrieving all invoices of a customer.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `amount_from`: Filter invoices of at least a specific amount. This parameter must be defined in cents to ensure consistent handling for all currency types.
    * `amount_to`: Filter invoices up to a specific amount. This parameter must be defined in cents to ensure consistent handling for all currency types.
    * `issuing_date_from`: Filter invoices starting from a specific date.
    * `issuing_date_to`: Filter invoices up to a specific date.
    * `status`: Filter invoices by status. Possible values are `draft` or `finalized`.
    * `payment_status`: Filter invoices by payment status. Possible values are `pending`, `failed` or `succeeded`.
    * `payment_overdue`: Filter invoices by payment_overdue. Possible values are `true` or `false`.
    * `search_term`: Search invoices by id, number, customer name, customer external_id or customer email.
    * `payment_dispute_lost`: Filter invoices with a payment dispute lost. Possible values are `true` or `false`.
    * `invoice_type`: Filter invoices by invoice type. Possible values are `subscription`, `add_on`, `credit`, `one_off`, `advance_charges` or `progressive_billing`.
    * `self_billed`: Filter invoices by self billed. Possible values are `true` or `false`.
    * `metadata[key]`: Filter invoices by metadata. Replace `key` with the actual metadata key you want to match, and provide the corresponding value. Providing empty value will search for invoice without given metadata key. For example, `metadata[color]=blue`.

  """
  @spec find_all_customer_invoices(external_customer_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.InvoicesPaginated.t()}
          | {:error,
             Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def find_all_customer_invoices(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :amount_from,
        :amount_to,
        :invoice_type,
        :issuing_date_from,
        :issuing_date_to,
        :"metadata[key]",
        :page,
        :payment_dispute_lost,
        :payment_overdue,
        :payment_status,
        :per_page,
        :search_term,
        :self_billed,
        :status
      ])

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {Lago.Invoices, :find_all_customer_invoices},
      url: "/customers/#{external_customer_id}/invoices",
      method: :get,
      query: query,
      response: [
        {200, {Lago.InvoicesPaginated, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all invoices

  This endpoint is used for retrieving all invoices.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `external_customer_id`: Unique identifier assigned to the customer in your application.
    * `amount_from`: Filter invoices of at least a specific amount. This parameter must be defined in cents to ensure consistent handling for all currency types.
    * `amount_to`: Filter invoices up to a specific amount. This parameter must be defined in cents to ensure consistent handling for all currency types.
    * `issuing_date_from`: Filter invoices starting from a specific date.
    * `issuing_date_to`: Filter invoices up to a specific date.
    * `statuses[]`: Filter invoices by statuses. Possible values are `draft`, `failed`, `finalized`, `pending` and `voided`.
    * `payment_statuses[]`: Filter invoices by payment statuses. Possible values are `pending`, `failed` or `succeeded`.
    * `payment_overdue`: Filter invoices by payment_overdue. Possible values are `true` or `false`.
    * `search_term`: Search invoices by id, number, customer name, customer external_id or customer email.
    * `currency`: Filter invoices by currency. Possible values ISO 4217 currency codes.
    * `payment_dispute_lost`: Filter invoices with a payment dispute lost. Possible values are `true` or `false`.
    * `invoice_type`: Filter invoices by invoice type. Possible values are `subscription`, `add_on`, `credit`, `one_off`, `advance_charges` or `progressive_billing`.
    * `self_billed`: Filter invoices by self billed. Possible values are `true` or `false`.
    * `billing_entity_codes[]`: Filter invoices by billing entity codes. Possible values are the billing entity codes you have created.
    * `metadata[key]`: Filter invoices by metadata. Replace `key` with the actual metadata key you want to match, and provide the corresponding value. Providing empty value will search for invoice without given metadata key. For example, `metadata[color]=blue`.

  """
  @spec find_all_invoices(opts :: keyword) ::
          {:ok, Lago.InvoicesPaginated.t()} | {:error, Lago.ApiErrorUnauthorized.t()}
  def find_all_invoices(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :amount_from,
        :amount_to,
        :"billing_entity_codes[]",
        :currency,
        :external_customer_id,
        :invoice_type,
        :issuing_date_from,
        :issuing_date_to,
        :"metadata[key]",
        :page,
        :payment_dispute_lost,
        :payment_overdue,
        :"payment_statuses[]",
        :per_page,
        :search_term,
        :self_billed,
        :"statuses[]"
      ])

    client.request(%{
      args: [],
      call: {Lago.Invoices, :find_all_invoices},
      url: "/invoices",
      method: :get,
      query: query,
      response: [{200, {Lago.InvoicesPaginated, :t}}, {401, {Lago.ApiErrorUnauthorized, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieve an invoice

  This endpoint is used for retrieving a specific invoice that has been issued.
  """
  @spec find_invoice(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.Invoice.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_invoice(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.Invoices, :find_invoice},
      url: "/invoices/#{lago_id}",
      method: :get,
      response: [
        {200, {Lago.Invoice, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Generate a payment URL

  This endpoint generates a checkout link for a specific invoice.
  """
  @spec invoice_payment_url(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.InvoicePaymentUrl.t()}
          | {:error,
             Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def invoice_payment_url(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.Invoices, :invoice_payment_url},
      url: "/invoices/#{lago_id}/payment_url",
      method: :post,
      response: [
        {200, {Lago.InvoicePaymentUrl, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create an invoice preview

  This endpoint is used for generating invoice preview.

  ## Request Body

  **Content Types**: `application/json`

  Invoice preview payload
  """
  @spec invoice_preview(body :: Lago.InvoicePreviewInput.t(), opts :: keyword) ::
          {:ok, Lago.Invoice.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def invoice_preview(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.Invoices, :invoice_preview},
      url: "/invoices/preview",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.InvoicePreviewInput, :t}}],
      response: [
        {200, {Lago.Invoice, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Mark an invoice payment dispute as lost

  This endpoint is used for setting invoice's payment dispute as lost.
  """
  @spec lose_dispute_invoice(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.Invoice.t()}
          | {:error,
             Lago.ApiErrorNotAllowed.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()}
  def lose_dispute_invoice(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.Invoices, :lose_dispute_invoice},
      url: "/invoices/#{lago_id}/lose_dispute",
      method: :post,
      response: [
        {200, {Lago.Invoice, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {405, {Lago.ApiErrorNotAllowed, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Refresh a draft invoice

  This endpoint is used for refreshing a draft invoice.
  """
  @spec refresh_invoice(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.Invoice.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def refresh_invoice(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.Invoices, :refresh_invoice},
      url: "/invoices/#{lago_id}/refresh",
      method: :put,
      response: [
        {200, {Lago.Invoice, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retry generation of a failed invoice

  This endpoint is used for retrying to generate a failed invoice.
  """
  @spec retry_invoice(lago_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.Invoice.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def retry_invoice(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.Invoices, :retry_invoice},
      url: "/invoices/#{lago_id}/retry",
      method: :post,
      response: [
        {200, {Lago.Invoice, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retry an invoice payment

  This endpoint resends an invoice for collection and retry a payment.
  """
  @spec retry_payment(lago_id :: String.t(), opts :: keyword) ::
          :ok
          | {:error,
             Lago.ApiErrorNotAllowed.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()}
  def retry_payment(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {Lago.Invoices, :retry_payment},
      url: "/invoices/#{lago_id}/retry_payment",
      method: :post,
      response: [
        {200, :null},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {405, {Lago.ApiErrorNotAllowed, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update an invoice

  This endpoint is used for updating an existing invoice.

  ## Request Body

  **Content Types**: `application/json`

  Update an existing invoice
  """
  @spec update_invoice(
          lago_id :: String.t(),
          body :: Lago.InvoiceUpdateInput.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.Invoice.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def update_invoice(lago_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id, body: body],
      call: {Lago.Invoices, :update_invoice},
      url: "/invoices/#{lago_id}",
      body: body,
      method: :put,
      request: [{"application/json", {Lago.InvoiceUpdateInput, :t}}],
      response: [
        {200, {Lago.Invoice, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Void an invoice

  This endpoint is used for voiding an invoice.
  • When no body parameters are provided, the invoice can be voided only if it is in a `finalized` status and its payment status is NOT `succeeded`.
  • When `generate_credit_note` is provided (optionally with `refund_amount` and/or `credit_amount`), this validation is bypassed: the invoice is forcibly voided and a credit note is generated. If the specified refund/credit amounts do not cover the full invoice total, the remainder is issued on a second credit note that is created and immediately voided.

  ## Request Body

  **Content Types**: `application/json`

  Void invoice payload
  """
  @spec void_invoice(lago_id :: String.t(), body :: Lago.InvoiceVoidInput.t(), opts :: keyword) ::
          {:ok, Lago.Invoice.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def void_invoice(lago_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id, body: body],
      call: {Lago.Invoices, :void_invoice},
      url: "/invoices/#{lago_id}/void",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.InvoiceVoidInput, :t}}],
      response: [
        {200, {Lago.Invoice, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end
end
