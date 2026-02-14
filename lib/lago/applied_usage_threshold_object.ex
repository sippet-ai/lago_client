defmodule Lago.AppliedUsageThresholdObject do
  @moduledoc """
  Provides struct and type for a AppliedUsageThresholdObject
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          lifetime_usage_amount_cents: integer,
          usage_threshold: Lago.UsageThresholdObject.t()
        }

  defstruct [:created_at, :lifetime_usage_amount_cents, :usage_threshold]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, "date-time"},
      lifetime_usage_amount_cents: :integer,
      usage_threshold: {Lago.UsageThresholdObject, :t}
    ]
  end
end
