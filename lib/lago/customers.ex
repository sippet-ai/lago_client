defmodule Lago.Customers do
  @moduledoc """
  Provides API endpoints related to customers
  """

  @default_client Lago.Client

  @doc """
  Create a customer

  This endpoint creates a new customer.

  ## Request Body

  **Content Types**: `application/json`

  Customer payload
  """
  @spec create_customer(body :: Lago.CustomerCreateInput.t(), opts :: keyword) ::
          {:ok, Lago.Customer.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_customer(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.Customers, :create_customer},
      url: "/customers",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.CustomerCreateInput, :t}}],
      response: [
        {200, {Lago.Customer, :t}},
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
      call: {Lago.Customers, :delete_applied_coupon},
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
  Delete a customer

  This endpoint deletes an existing customer.
  """
  @spec destroy_customer(external_customer_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.Customer.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def destroy_customer(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {Lago.Customers, :destroy_customer},
      url: "/customers/#{external_customer_id}",
      method: :delete,
      response: [
        {200, {Lago.Customer, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
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
      call: {Lago.Customers, :find_all_customer_applied_coupons},
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
  List all customer's credit notes

  This endpoint list all existing credit notes for a customer.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `issuing_date_from`: Filter credit notes starting from a specific date.
    * `issuing_date_to`: Filter credit notes up to a specific date.
    * `search_term`: Search credit notes by id, number, customer name, customer external_id or customer email.
    * `reason`: Filter credit notes by reasons. Possible values are `product_unsatisfactory`, `order_change`, `order_cancellation`, `fraudulent_charge`, `duplicated_charge` or `other`.
    * `credit_status`: Filter credit notes by credit status. Possible values are `available`, `consumed`  or `voided`.
    * `refund_status`: Filter credit notes by refund status. Possible values are `pending`, `succeeded`  or `failed`.
    * `invoice_number`: Filter credit notes by their related invoice number.
    * `amount_from`: Filter credit notes of at least a specific amount. This parameter must be defined in cents to ensure consistent handling for all currency types.
    * `amount_to`: Filter credit notes up to a specific amount. This parameter must be defined in cents to ensure consistent handling for all currency types.
    * `self_billed`: Filter credit notes belonging to a self billed invoice. Possible values are `true` or `false`.

  """
  @spec find_all_customer_credit_notes(external_customer_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.CreditNotesPaginated.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_all_customer_credit_notes(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :amount_from,
        :amount_to,
        :credit_status,
        :invoice_number,
        :issuing_date_from,
        :issuing_date_to,
        :page,
        :per_page,
        :reason,
        :refund_status,
        :search_term,
        :self_billed
      ])

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {Lago.Customers, :find_all_customer_credit_notes},
      url: "/customers/#{external_customer_id}/credit_notes",
      method: :get,
      query: query,
      response: [
        {200, {Lago.CreditNotesPaginated, :t}},
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
      call: {Lago.Customers, :find_all_customer_invoices},
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
  Retrieve customer past usage

  This endpoint enables the retrieval of the usage-based billing data for a customer within past periods.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `external_subscription_id`: The unique identifier of the subscription within your application.
    * `billable_metric_code`: Billable metric code filter to apply to the charge usage
    * `periods_count`: Number of past billing period to returns in the result

  """
  @spec find_all_customer_past_usage(external_customer_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.CustomerPastUsage.t()}
          | {:error,
             Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def find_all_customer_past_usage(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :billable_metric_code,
        :external_subscription_id,
        :page,
        :per_page,
        :periods_count
      ])

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {Lago.Customers, :find_all_customer_past_usage},
      url: "/customers/#{external_customer_id}/past_usage",
      method: :get,
      query: query,
      response: [
        {200, {Lago.CustomerPastUsage, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
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
      call: {Lago.Customers, :find_all_customer_payment_requests},
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
      call: {Lago.Customers, :find_all_customer_payments},
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
  List all customer's subscriptions

  This endpoint retrieves all active subscriptions for a customer.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `plan_code`: The unique code representing the plan to be attached to the customer. This code must correspond to the code property of one of the active plans.
    * `status[]`: If the field is not defined, Lago will return only `active` subscriptions. However, if you wish to fetch subscriptions by different status you can define them in a status[] query param. Available filter values: `pending`, `canceled`, `terminated`, `active`.

  """
  @spec find_all_customer_subscriptions(external_customer_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.SubscriptionsPaginated.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_all_customer_subscriptions(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :plan_code, :"status[]"])

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {Lago.Customers, :find_all_customer_subscriptions},
      url: "/customers/#{external_customer_id}/subscriptions",
      method: :get,
      query: query,
      response: [
        {200, {Lago.SubscriptionsPaginated, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all customer's wallets

  This endpoint is used to list all wallets with prepaid credits of a customer

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.

  """
  @spec find_all_customer_wallets(external_customer_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.WalletsPaginated.t()}
          | {:error,
             Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()}
  def find_all_customer_wallets(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {Lago.Customers, :find_all_customer_wallets},
      url: "/customers/#{external_customer_id}/wallets",
      method: :get,
      query: query,
      response: [
        {200, {Lago.WalletsPaginated, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all customers

  This endpoint retrieves all existing customers.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `account_type[]`: Filter customers by account type.
    * `billing_entity_codes[]`: Filter customers by billing entity codes.
    * `search_term`: Filter customers by search term. This will filter all customers whose name, firstname, lastname, legal name, external id or email contain the search term.
    * `countries[]`: Filter customers by countries. Possible values are the ISO 3166-1 alpha-2 codes.
    * `states[]`: Filter customers by states.
    * `zipcodes[]`: Filter customers by zipcodes.
    * `currencies[]`: Filter customers by currencies.
    * `has_tax_identification_number`: Filter customers by whether they have a tax identification number or not.
    * `metadata[key]`: Filter customers by metadata. Replace `key` with the actual metadata key you want to match, and provide the corresponding value. Providing empty value will search for customers without given metadata key. For example, `metadata[is_synced]=true&metadata[last_synced_at]=`.
    * `customer_type`: Filter customers by customer type.
    * `has_customer_type`: Filter customers by whether they have a customer type or not.

  """
  @spec find_all_customers(opts :: keyword) ::
          {:ok, Lago.CustomersPaginated.t()} | {:error, Lago.ApiErrorUnauthorized.t()}
  def find_all_customers(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"account_type[]",
        :"billing_entity_codes[]",
        :"countries[]",
        :"currencies[]",
        :customer_type,
        :has_customer_type,
        :has_tax_identification_number,
        :"metadata[key]",
        :page,
        :per_page,
        :search_term,
        :"states[]",
        :"zipcodes[]"
      ])

    client.request(%{
      args: [],
      call: {Lago.Customers, :find_all_customers},
      url: "/customers",
      method: :get,
      query: query,
      response: [{200, {Lago.CustomersPaginated, :t}}, {401, {Lago.ApiErrorUnauthorized, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieve a customer

  This endpoint retrieves an existing customer.
  """
  @spec find_customer(external_customer_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.Customer.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_customer(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {Lago.Customers, :find_customer},
      url: "/customers/#{external_customer_id}",
      method: :get,
      response: [
        {200, {Lago.Customer, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve customer current usage

  This endpoint enables the retrieval of the usage-based billing data for a customer within the current period.

  ## Options

    * `external_subscription_id`: The unique identifier of the subscription within your application.
    * `apply_taxes`: Optional flag to determine if taxes should be applied. Defaults to `true` if not provided or if null.
      

  """
  @spec find_customer_current_usage(external_customer_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.CustomerUsage.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_customer_current_usage(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:apply_taxes, :external_subscription_id])

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {Lago.Customers, :find_customer_current_usage},
      url: "/customers/#{external_customer_id}/current_usage",
      method: :get,
      query: query,
      response: [
        {200, {Lago.CustomerUsage, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve customer current and projected usage

  This endpoint enables the retrieval of the usage-based billing data for a customer within the current period. It also returns the projected usage for the current period based on the current usage.

  ## Options

    * `external_subscription_id`: The unique identifier of the subscription within your application.
    * `apply_taxes`: Optional flag to determine if taxes should be applied. Defaults to `true` if not provided or if null.
      

  """
  @spec find_customer_projected_usage(external_customer_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.CustomerProjectedUsage.t()}
          | {:error,
             Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()}
  def find_customer_projected_usage(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:apply_taxes, :external_subscription_id])

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {Lago.Customers, :find_customer_projected_usage},
      url: "/customers/#{external_customer_id}/projected_usage",
      method: :get,
      query: query,
      response: [
        {200, {Lago.CustomerProjectedUsage, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Generate a Customer Payment Provider Checkout URL

  This endpoint regenerates the Payment Provider Checkout URL of a Customer.
  """
  @spec generate_customer_checkout_url(external_customer_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.CustomerCheckoutUrl.t()}
          | {:error,
             Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def generate_customer_checkout_url(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {Lago.Customers, :generate_customer_checkout_url},
      url: "/customers/#{external_customer_id}/checkout_url",
      method: :post,
      response: [
        {200, {Lago.CustomerCheckoutUrl, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @type get_customer_portal_url_200_json_resp :: %{
          customer: Lago.Customers.get_customer_portal_url_200_json_resp_customer()
        }

  @type get_customer_portal_url_200_json_resp_customer :: %{portal_url: String.t()}

  @doc """
  Get a customer portal URL

  Retrieves an embeddable link for displaying a customer portal.

  This endpoint allows you to fetch the URL that can be embedded to provide customers access to a dedicated portal
  """
  @spec get_customer_portal_url(external_customer_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.Customers.get_customer_portal_url_200_json_resp()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def get_customer_portal_url(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {Lago.Customers, :get_customer_portal_url},
      url: "/customers/#{external_customer_id}/portal_url",
      method: :get,
      response: [
        {200, {Lago.Customers, :get_customer_portal_url_200_json_resp}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_customer_portal_url_200_json_resp) do
    [customer: {Lago.Customers, :get_customer_portal_url_200_json_resp_customer}]
  end

  def __fields__(:get_customer_portal_url_200_json_resp_customer) do
    [portal_url: :string]
  end
end
