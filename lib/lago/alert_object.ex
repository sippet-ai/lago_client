defmodule Lago.AlertObject do
  @moduledoc """
  Provides struct and type for a AlertObject
  """

  @type t :: %__MODULE__{
          alert_type: String.t(),
          billable_metric: Lago.BillableMetricObject.t(),
          code: String.t(),
          created_at: DateTime.t(),
          external_customer_id: String.t(),
          external_subscription_id: String.t(),
          lago_id: String.t(),
          lago_organization_id: String.t(),
          last_processed_at: DateTime.t() | nil,
          name: String.t() | nil,
          previous_value: number,
          thresholds: [Lago.AlertThresholdObject.t()]
        }

  defstruct [
    :alert_type,
    :billable_metric,
    :code,
    :created_at,
    :external_customer_id,
    :external_subscription_id,
    :lago_id,
    :lago_organization_id,
    :last_processed_at,
    :name,
    :previous_value,
    :thresholds
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      alert_type:
        {:enum,
         [
           "current_usage_amount",
           "billable_metric_current_usage_amount",
           "billable_metric_current_usage_units",
           "lifetime_usage_amount"
         ]},
      billable_metric: {Lago.BillableMetricObject, :t},
      code: :string,
      created_at: {:string, "date-time"},
      external_customer_id: :string,
      external_subscription_id: :string,
      lago_id: {:string, "uuid"},
      lago_organization_id: {:string, "uuid"},
      last_processed_at: {:union, [{:string, "date-time"}, :null]},
      name: {:union, [:string, :null]},
      previous_value: :number,
      thresholds: [{Lago.AlertThresholdObject, :t}]
    ]
  end
end
