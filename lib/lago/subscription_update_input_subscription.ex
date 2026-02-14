defmodule Lago.SubscriptionUpdateInputSubscription do
  @moduledoc """
  Provides struct and type for a SubscriptionUpdateInputSubscription
  """

  @type t :: %__MODULE__{
          ending_at: DateTime.t() | nil,
          name: String.t() | nil,
          plan_overrides: Lago.PlanOverridesObject.t() | nil,
          subscription_at: DateTime.t() | nil
        }

  defstruct [:ending_at, :name, :plan_overrides, :subscription_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ending_at: {:union, [{:string, "date-time"}, :null]},
      name: {:union, [:string, :null]},
      plan_overrides: {Lago.PlanOverridesObject, :t},
      subscription_at: {:string, "date-time"}
    ]
  end
end
