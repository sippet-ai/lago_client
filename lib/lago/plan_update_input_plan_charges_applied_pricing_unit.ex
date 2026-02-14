defmodule Lago.PlanUpdateInputPlanChargesAppliedPricingUnit do
  @moduledoc """
  Provides struct and type for a PlanUpdateInputPlanChargesAppliedPricingUnit
  """

  @type t :: %__MODULE__{conversion_rate: String.t() | nil}

  defstruct [:conversion_rate]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [conversion_rate: :string]
  end
end
