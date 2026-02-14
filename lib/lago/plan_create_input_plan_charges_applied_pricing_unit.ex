defmodule Lago.PlanCreateInputPlanChargesAppliedPricingUnit do
  @moduledoc """
  Provides struct and type for a PlanCreateInputPlanChargesAppliedPricingUnit
  """

  @type t :: %__MODULE__{code: String.t() | nil, conversion_rate: String.t() | nil}

  defstruct [:code, :conversion_rate]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: :string, conversion_rate: :string]
  end
end
