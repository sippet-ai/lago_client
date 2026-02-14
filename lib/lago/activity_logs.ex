defmodule Lago.ActivityLogs do
  @moduledoc """
  Provides API endpoints related to activity logs
  """

  @default_client Lago.Client

  @doc """
  Retrieve an activity log

  This endpoint retrieves an existing activity log that represents an action performed on some resource. The activity log is identified by its unique activity_id.
  """
  @spec find_activity_log(activity_id :: String.t(), opts :: keyword) ::
          {:ok, Lago.ActivityLog.t()}
          | {:error, Lago.ApiErrorNotFound.t() | Lago.ApiErrorUnauthorized.t()}
  def find_activity_log(activity_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [activity_id: activity_id],
      call: {Lago.ActivityLogs, :find_activity_log},
      url: "/activity_logs/#{activity_id}",
      method: :get,
      response: [
        {200, {Lago.ActivityLog, :t}},
        {401, {Lago.ApiErrorUnauthorized, :t}},
        {404, {Lago.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all activity logs

  This endpoint retrieves all existing activity logs that represent actions performed on application resources.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `from_date`: Filter activity logs from a specific date.
    * `to_date`: Filter activity logs up to a specific date.
    * `activity_types[]`: Filter results by activity types
    * `activity_sources[]`: Filter results by activity sources
    * `user_emails[]`: Filter results by user emails
    * `external_customer_id`: Unique identifier assigned to the customer in your application.
    * `external_subscription_id`: External subscription ID
    * `resource_ids[]`: Filter results by resources unique identifiers
    * `resource_types[]`: Filter results by resource class types

  """
  @spec find_all_activity_logs(opts :: keyword) ::
          {:ok, Lago.ActivityLogsPaginated.t()} | {:error, Lago.ApiErrorUnauthorized.t()}
  def find_all_activity_logs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"activity_sources[]",
        :"activity_types[]",
        :external_customer_id,
        :external_subscription_id,
        :from_date,
        :page,
        :per_page,
        :"resource_ids[]",
        :"resource_types[]",
        :to_date,
        :"user_emails[]"
      ])

    client.request(%{
      args: [],
      call: {Lago.ActivityLogs, :find_all_activity_logs},
      url: "/activity_logs",
      method: :get,
      query: query,
      response: [{200, {Lago.ActivityLogsPaginated, :t}}, {401, {Lago.ApiErrorUnauthorized, :t}}],
      opts: opts
    })
  end
end
