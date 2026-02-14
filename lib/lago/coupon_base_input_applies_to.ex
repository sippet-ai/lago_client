defmodule Lago.CouponBaseInputAppliesTo do
  @moduledoc """
  Provides struct and type for a CouponBaseInputAppliesTo
  """

  @type t :: %__MODULE__{
          billable_metric_codes: [String.t()] | nil,
          plan_codes: [String.t()] | nil
        }

  defstruct [:billable_metric_codes, :plan_codes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billable_metric_codes: {:union, [[:string], :null]},
      plan_codes: {:union, [[:string], :null]}
    ]
  end
end
