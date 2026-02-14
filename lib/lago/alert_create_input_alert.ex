defmodule Lago.AlertCreateInputAlert do
  @moduledoc """
  Provides struct and type for a AlertCreateInputAlert
  """

  @type t :: %__MODULE__{
          alert_type: String.t() | nil,
          billable_metric_code: String.t() | nil,
          code: String.t() | nil,
          name: String.t() | nil,
          thresholds: [Lago.AlertThresholdInput.t()] | nil
        }

  defstruct [:alert_type, :billable_metric_code, :code, :name, :thresholds]

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
      billable_metric_code: {:union, [:string, :null]},
      code: :string,
      name: {:union, [:string, :null]},
      thresholds: [{Lago.AlertThresholdInput, :t}]
    ]
  end
end
