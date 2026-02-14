defmodule Lago.Subscriptions do
  @moduledoc """
  Provides API endpoints related to subscriptions
  """

  @default_client Lago.Client

  @doc """
  Assign a plan to a customer

  This endpoint assigns a plan to a customer, creating or modifying a subscription. Ideal for initial subscriptions or plan changes (upgrades/downgrades).

  ## Request Body

  **Content Types**: `application/json`

  Subscription payload
  """
  @spec create_subscription(body :: Lago.SubscriptionCreateInput.t(), opts :: keyword) ::
          {:ok, Lago.Subscription.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_subscription(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.Subscriptions, :create_subscription},
      url: "/subscriptions",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.SubscriptionCreateInput, :t}}],
      response: [
        {200, {Lago.Subscription, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create subscription alert(s)

  This endpoint allows you to create alerts for a subscription. Send a single alert object wrapped in `alert` key to create one alert, or an array of alert objects wrapped in `alerts` key to create multiple alerts atomically.

  ## Request Body

  **Content Types**: `application/json`

  Create one or more alerts for a subscription
  """
  @spec create_subscription_alert(
          external_id :: String.t(),
          body :: Lago.AlertBatchCreateInput.t() | Lago.AlertCreateInput.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.Alert.t() | Lago.Alerts.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_subscription_alert(external_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id, body: body],
      call: {Lago.Subscriptions, :create_subscription_alert},
      url: "/subscriptions/#{external_id}/alerts",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union, [{Lago.AlertBatchCreateInput, :t}, {Lago.AlertCreateInput, :t}]}}
      ],
      response: [
        {200, {:union, [{Lago.Alert, :t}, {Lago.Alerts, :t}]}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete all subscription alerts

  This endpoint allows you to delete all alerts for a subscription.
  """
  @spec delete_all_subscription_alerts(external_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def delete_all_subscription_alerts(external_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id],
      call: {Lago.Subscriptions, :delete_all_subscription_alerts},
      url: "/subscriptions/#{external_id}/alerts",
      method: :delete,
      response: [
        {200, :null},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a subscription alert

  This endpoint allows you to delete an existing alert for a subscription.
  """
  @spec delete_subscription_alert(external_id :: String.t(), code :: String.t(), opts :: keyword) ::
          {:ok, Lago.Alert.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def delete_subscription_alert(external_id, code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id, code: code],
      call: {Lago.Subscriptions, :delete_subscription_alert},
      url: "/subscriptions/#{external_id}/alerts/#{code}",
      method: :delete,
      response: [
        {200, {Lago.Alert, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Terminate a subscription

  This endpoint allows you to terminate a subscription.

  ## Options

    * `status`: If the field is not defined, Lago will terminate only `active` subscriptions. However, if you wish to cancel a `pending` subscription, please ensure that you include `status=pending` in your request.
    * `on_termination_credit_note`: When a pay-in-advance subscription is terminated before the end of its billing period, we generate a credit note for the unused subscription time by default.
      This field allows you to control the behavior of the credit note generation:
      
      - `credit`: A credit note is generated for the unused subscription time. The unused amount is credited back to the customer.
      - `refund`: A credit note is generated for the unused subscription time. If the invoice is paid or partially paid, the unused paid amount is refunded; any unpaid unused amount is credited back to the customer.
      - `skip`: No credit note is generated for the unused subscription time.
      
      _Note: This field is only applicable to pay-in-advance plans and is ignored for pay-in-arrears plans._
      
    * `on_termination_invoice`: When a subscription is terminated before the end of its billing period, we generate an invoice for the unbilled usage.
      This field allows you to control the behavior of the invoice generation:
      
      - `generate`: An invoice is generated for the unbilled usage.
      - `skip`: No invoice is generated for the unbilled usage.
      

  """
  @spec destroy_subscription(external_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.Subscription.t()}
          | {:error,
             Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def destroy_subscription(external_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:on_termination_credit_note, :on_termination_invoice, :status])

    client.request(%{
      args: [external_id: external_id],
      call: {Lago.Subscriptions, :destroy_subscription},
      url: "/subscriptions/#{external_id}",
      method: :delete,
      query: query,
      response: [
        {200, {Lago.Subscription, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
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
      call: {Lago.Subscriptions, :find_all_customer_subscriptions},
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
  List subscription fixed charges

  This endpoint retrieves all fixed charges for a specific subscription.
  """
  @spec find_all_subscription_fixed_charges(external_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.FixedCharges.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_all_subscription_fixed_charges(external_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id],
      call: {Lago.Subscriptions, :find_all_subscription_fixed_charges},
      url: "/subscriptions/#{external_id}/fixed_charges",
      method: :get,
      response: [
        {200, {Lago.FixedCharges, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all subscriptions

  This endpoint retrieves all active subscriptions.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `external_customer_id`: The customer external unique identifier (provided by your own application)
    * `plan_code`: The unique code representing the plan to be attached to the customer. This code must correspond to the code property of one of the active plans.
    * `status[]`: If the field is not defined, Lago will return only `active` subscriptions. However, if you wish to fetch subscriptions by different status you can define them in a status[] query param. Available filter values: `pending`, `canceled`, `terminated`, `active`.

  """
  @spec find_all_subscriptions(opts :: keyword) ::
          {:ok, Lago.SubscriptionsPaginated.t()} | {:error, Lago.ApiErrorUnauthorized.t()}
  def find_all_subscriptions(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:external_customer_id, :page, :per_page, :plan_code, :"status[]"])

    client.request(%{
      args: [],
      call: {Lago.Subscriptions, :find_all_subscriptions},
      url: "/subscriptions",
      method: :get,
      query: query,
      response: [{200, {Lago.SubscriptionsPaginated, :t}}, {401, {Lago.ApiErrorUnauthorized, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieve a subscription

  This endpoint retrieves a specific subscription.

  ## Options

    * `status`: By default, this endpoint only return `active` subscriptions. If you want to retrieve a subscription with a different `status`, you can specify it here.
      
      _Note: As there may exists multiple `canceled` or `terminated` subscribtions for the same `external_id`, it is recommended to use the "List all subscriptions" endpoint to retrieve those subscriptions._
      

  """
  @spec find_subscription(external_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.Subscription.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_subscription(external_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:status])

    client.request(%{
      args: [external_id: external_id],
      call: {Lago.Subscriptions, :find_subscription},
      url: "/subscriptions/#{external_id}",
      method: :get,
      query: query,
      response: [
        {200, {Lago.Subscription, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a subscription alert

  This endpoint enables the retrieval of a specific alert for a subscription.
  """
  @spec get_subscription_alert(external_id :: String.t(), code :: String.t(), opts :: keyword) ::
          {:ok, Lago.Alert.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def get_subscription_alert(external_id, code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id, code: code],
      call: {Lago.Subscriptions, :get_subscription_alert},
      url: "/subscriptions/#{external_id}/alerts/#{code}",
      method: :get,
      response: [
        {200, {Lago.Alert, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List subscription alerts

  This endpoint enables the retrieval of all alerts for a subscription.
  """
  @spec get_subscription_alerts(external_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.Alerts.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def get_subscription_alerts(external_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id],
      call: {Lago.Subscriptions, :get_subscription_alerts},
      url: "/subscriptions/#{external_id}/alerts",
      method: :get,
      response: [
        {200, {Lago.Alerts, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve subscription lifetime usage

  This endpoint enables the retrieval of the lifetime usage of a subscription.
  """
  @spec get_subscription_lifetime_usage(external_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.LifetimeUsage.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def get_subscription_lifetime_usage(external_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id],
      call: {Lago.Subscriptions, :get_subscription_lifetime_usage},
      url: "/subscriptions/#{external_id}/lifetime_usage",
      method: :get,
      response: [
        {200, {Lago.LifetimeUsage, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a subscription

  This endpoint allows you to update a subscription.

  ## Options

    * `status`: By default, this endpoint only return `active` subscriptions. If you want to update a subscription with a different `status`, you can specify it here.
      

  ## Request Body

  **Content Types**: `application/json`

  Update an existing subscription
  """
  @spec update_subscription(
          external_id :: String.t(),
          body :: Lago.SubscriptionUpdateInput.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.Subscription.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def update_subscription(external_id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:status])

    client.request(%{
      args: [external_id: external_id, body: body],
      call: {Lago.Subscriptions, :update_subscription},
      url: "/subscriptions/#{external_id}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", {Lago.SubscriptionUpdateInput, :t}}],
      response: [
        {200, {Lago.Subscription, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a subscription alert

  This endpoint allows you to update an existing alert for a subscription.

  ## Request Body

  **Content Types**: `application/json`

  Update an existing alert for a subscription
  """
  @spec update_subscription_alert(
          external_id :: String.t(),
          code :: String.t(),
          body :: Lago.AlertUpdateInput.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.Alert.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def update_subscription_alert(external_id, code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id, code: code, body: body],
      call: {Lago.Subscriptions, :update_subscription_alert},
      url: "/subscriptions/#{external_id}/alerts/#{code}",
      body: body,
      method: :put,
      request: [{"application/json", {Lago.AlertUpdateInput, :t}}],
      response: [
        {200, {Lago.Alert, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a subscription lifetime usage

  This endpoint allows you to update the lifetime usage of a subscription.

  ## Request Body

  **Content Types**: `application/json`

  Update the lifetime usage of a subscription
  """
  @spec update_subscription_lifetime_usage(
          external_id :: String.t(),
          body :: Lago.LifetimeUsageInput.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.LifetimeUsage.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def update_subscription_lifetime_usage(external_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id, body: body],
      call: {Lago.Subscriptions, :update_subscription_lifetime_usage},
      url: "/subscriptions/#{external_id}/lifetime_usage",
      body: body,
      method: :put,
      request: [{"application/json", {Lago.LifetimeUsageInput, :t}}],
      response: [
        {200, {Lago.LifetimeUsage, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
