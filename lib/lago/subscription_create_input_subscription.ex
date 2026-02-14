defmodule Lago.SubscriptionCreateInputSubscription do
  @moduledoc """
  Provides struct and type for a SubscriptionCreateInputSubscription
  """

  @type t :: %__MODULE__{
          billing_entity_code: String.t() | nil,
          billing_time: String.t() | nil,
          ending_at: DateTime.t() | nil,
          external_customer_id: String.t(),
          external_id: String.t(),
          name: String.t() | nil,
          plan_code: String.t(),
          plan_overrides: Lago.PlanOverridesObject.t() | nil,
          subscription_at: DateTime.t() | nil
        }

  defstruct [
    :billing_entity_code,
    :billing_time,
    :ending_at,
    :external_customer_id,
    :external_id,
    :name,
    :plan_code,
    :plan_overrides,
    :subscription_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billing_entity_code: :string,
      billing_time: {:enum, ["calendar", "anniversary"]},
      ending_at: {:string, "date-time"},
      external_customer_id: :string,
      external_id: :string,
      name: :string,
      plan_code: :string,
      plan_overrides: {Lago.PlanOverridesObject, :t},
      subscription_at: {:string, "date-time"}
    ]
  end
end
