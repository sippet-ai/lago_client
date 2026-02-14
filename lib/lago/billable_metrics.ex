defmodule Lago.BillableMetrics do
  @moduledoc """
  Provides API endpoints related to billable metrics
  """

  @default_client Lago.Client

  @doc """
  Create a billable metric

  This endpoint creates a new billable metric representing a pricing component of your application.

  ## Request Body

  **Content Types**: `application/json`

  Billable metric payload
  """
  @spec create_billable_metric(body :: Lago.BillableMetricCreateInput.t(), opts :: keyword) ::
          {:ok, Lago.BillableMetric.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def create_billable_metric(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.BillableMetrics, :create_billable_metric},
      url: "/billable_metrics",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.BillableMetricCreateInput, :t}}],
      response: [
        {200, {Lago.BillableMetric, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a billable metric

  This endpoint deletes an existing billable metric representing a pricing component of your application.
  """
  @spec destroy_billable_metric(code :: String.t(), opts :: keyword) ::
          {:ok, Lago.BillableMetric.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def destroy_billable_metric(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {Lago.BillableMetrics, :destroy_billable_metric},
      url: "/billable_metrics/#{code}",
      method: :delete,
      response: [
        {200, {Lago.BillableMetric, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Evaluate an expression for a billable metric

  Evaluate an expression for a billable metric creation by providing the expression and test data

  ## Request Body

  **Content Types**: `application/json`

  Billable metric expression evaluation payload
  """
  @spec evaluate_billable_metric_expression(
          body :: Lago.BillableMetricEvaluateExpressionInput.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.BillableMetricEvaluateExpressionResult.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def evaluate_billable_metric_expression(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lago.BillableMetrics, :evaluate_billable_metric_expression},
      url: "/billable_metrics/evaluate_expression",
      body: body,
      method: :post,
      request: [{"application/json", {Lago.BillableMetricEvaluateExpressionInput, :t}}],
      response: [
        {200, {Lago.BillableMetricEvaluateExpressionResult, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all billable metrics

  This endpoint retrieves all existing billable metrics that represent pricing components of your application.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.

  """
  @spec find_all_billable_metrics(opts :: keyword) ::
          {:ok, Lago.BillableMetricsPaginated.t()} | {:error, Lago.ApiErrorUnauthorized.t()}
  def find_all_billable_metrics(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {Lago.BillableMetrics, :find_all_billable_metrics},
      url: "/billable_metrics",
      method: :get,
      query: query,
      response: [
        {200, {Lago.BillableMetricsPaginated, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a billable metric

  This endpoint retrieves an existing billable metric that represents a pricing component of your application. The billable metric is identified by its unique code.
  """
  @spec find_billable_metric(code :: String.t(), opts :: keyword) ::
          {:ok, Lago.BillableMetric.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_billable_metric(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {Lago.BillableMetrics, :find_billable_metric},
      url: "/billable_metrics/#{code}",
      method: :get,
      response: [
        {200, {Lago.BillableMetric, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a billable metric

  This endpoint updates an existing billable metric representing a pricing component of your application.

  ## Request Body

  **Content Types**: `application/json`

  Billable metric payload
  """
  @spec update_billable_metric(
          code :: String.t(),
          body :: Lago.BillableMetricUpdateInput.t(),
          opts :: keyword
        ) ::
          {:ok, Lago.BillableMetric.t()}
          | {:error,
             Lago.ApiErrorBadRequest.t()
             | Lago.ApiErrorNotFound.t()
             | Lago.ApiErrorUnauthorized.t()
             | Lago.ApiErrorUnprocessableEntity.t()}
  def update_billable_metric(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {Lago.BillableMetrics, :update_billable_metric},
      url: "/billable_metrics/#{code}",
      body: body,
      method: :put,
      request: [{"application/json", {Lago.BillableMetricUpdateInput, :t}}],
      response: [
        {200, {Lago.BillableMetric, :t}},
        {400, {Lago.ApiErrorBadRequest, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}},
        {422, {Lago.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
