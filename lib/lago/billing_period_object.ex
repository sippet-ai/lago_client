defmodule Lago.BillingPeriodObject do
  @moduledoc """
  Provides struct and type for a BillingPeriodObject
  """

  @type t :: %__MODULE__{
          charges_from_datetime: DateTime.t(),
          charges_to_datetime: DateTime.t(),
          external_subscription_id: String.t(),
          invoicing_reason: String.t(),
          lago_plan_id: String.t(),
          lago_subscription_id: String.t(),
          subscription_from_datetime: DateTime.t(),
          subscription_to_datetime: DateTime.t()
        }

  defstruct [
    :charges_from_datetime,
    :charges_to_datetime,
    :external_subscription_id,
    :invoicing_reason,
    :lago_plan_id,
    :lago_subscription_id,
    :subscription_from_datetime,
    :subscription_to_datetime
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      charges_from_datetime: {:string, "date-time"},
      charges_to_datetime: {:string, "date-time"},
      external_subscription_id: :string,
      invoicing_reason:
        {:enum,
         [
           "subscription_starting",
           "subscription_periodic",
           "subscription_terminating",
           "in_advance_charge",
           "in_advance_charge_periodic",
           "progressive_billing"
         ]},
      lago_plan_id: {:string, "uuid"},
      lago_subscription_id: {:string, "uuid"},
      subscription_from_datetime: {:string, "date-time"},
      subscription_to_datetime: {:string, "date-time"}
    ]
  end
end
