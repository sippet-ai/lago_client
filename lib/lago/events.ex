defmodule Lago.Events do
  @moduledoc """
  Provides API endpoints related to events
  """

  @default_client Lago.Client

  @doc """
  Batch multiple events

  This endpoint can be used to send a batch of usage records. Each request may include up to 100 events.

  ## Request Body

  **Content Types**: `application/json`

  Batch events payload
  """
  @spec create_batch_events(body :: Lago.EventBatchInput.t(), opts :: keyword) ::
          {:ok, Lago.EventsCreated.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_batch_events(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.Events, :create_batch_events},
      url: "/events/batch",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.EventBatchInput, :t}}],
      response: [
        {200, {Lago.EventsCreated, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Send usage events

  This endpoint is used for transmitting usage measurement events to either a designated customer or a specific subscription.

  ## Request Body

  **Content Types**: `application/json`

  Event payload
  """
  @spec create_event(body :: Lago.EventInput.t(), opts :: keyword) ::
          {:ok, Lago.EventCreated.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_event(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.Events, :create_event},
      url: "/events",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.EventInput, :t}}],
      response: [
        {200, {Lago.EventCreated, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Batch estimate instant fees for a pay in advance charge

  Estimate the fees that would be created after reception of an event for a billable metric attached to one or multiple pay in advance standard or percentage charges

  ## Request Body

  **Content Types**: `application/json`

  Batch event estimate instant payload
  """
  @spec event_batch_estimate_instant_fees(
          body :: Lago.EventBatchEstimateInstantFeesInput.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.FeesEstimate.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def event_batch_estimate_instant_fees(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.Events, :event_batch_estimate_instant_fees},
      url: "/events/batch_estimate_instant_fees",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.EventBatchEstimateInstantFeesInput, :t}}],
      response: [
        {200, {Lago.FeesEstimate, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Estimate fees for a pay in advance charge

  Estimate the fees that would be created after reception of an event for a billable metric attached to one or multiple pay in advance charges

  ## Request Body

  **Content Types**: `application/json`

  Event estimate payload
  """
  @spec event_estimate_fees(body :: Lago.EventEstimateFeesInput.t(), opts :: keyword) ::
          {:ok, Lago.Fees.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def event_estimate_fees(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.Events, :event_estimate_fees},
      url: "/events/estimate_fees",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.EventEstimateFeesInput, :t}}],
      response: [
        {200, {Lago.Fees, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Estimate instant fees for a pay in advance charge

  Estimate the fees that would be created after reception of an event for a billable metric attached to one or multiple pay in advance standard or percentage charges

  ## Request Body

  **Content Types**: `application/json`

  Event estimate instant payload
  """
  @spec event_estimate_instant_fees(
          body :: Lago.EventEstimateInstantFeesInput.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.FeesEstimate.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def event_estimate_instant_fees(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.Events, :event_estimate_instant_fees},
      url: "/events/estimate_instant_fees",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.EventEstimateInstantFeesInput, :t}}],
      response: [
        {200, {Lago.FeesEstimate, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all events

  This endpoint is used for retrieving all events.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `external_subscription_id`: External subscription ID
    * `code`: Filter events by its code.
    * `timestamp_from_started_at`: Requires `external_subscription_id` to be set. Filter events by timestamp after the subscription started at datetime.
    * `timestamp_from`: Filter events by timestamp starting from a specific date.
    * `timestamp_to`: Filter events by timestamp up to a specific date.

  """
  @spec find_all_events(opts :: keyword) ::
          {:ok, Lago.EventsPaginated.t()}
          | {:error,
             Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def find_all_events(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :code,
        :external_subscription_id,
        :page,
        :per_page,
        :timestamp_from,
        :timestamp_from_started_at,
        :timestamp_to
      ])

    client.request(%{
      args: [],
      call: {Lago.Events, :find_all_events},
      url: "/events",
      method: :get,
      query: query,
      response: [
        {200, {Lago.EventsPaginated, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a specific event

  This endpoint is used for retrieving a specific usage measurement event that has been sent to a customer or a subscription.

  Note that transaction_id is unique per external_subscription_id so multiple subscriptions can share the same transaction_id. This endpoint will only return the first event found with the given transaction_id.

  WARNING: If your Lago organization is configured to use the Clickhouse-based event pipeline, multiple events can share the same `transaction_id` (with different timestamps). This endpoint will only return the first event found.

  """
  @spec find_event(transaction_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.Event.t()}
          | {:error,
             Lago.ApiErrorForbidden.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()}
  def find_event(transaction_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [transaction_id: transaction_id],
      call: {Lago.Events, :find_event},
      url: "/events/#{transaction_id}",
      method: :get,
      response: [
        {200, {Lago.Event, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {403, {Lago.ApiErrorForbidden, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end
end
