defmodule Lago.ChargeObjectAppliedPricingUnit do
  @moduledoc """
  Provides struct and type for a ChargeObjectAppliedPricingUnit
  """

  @type t :: %__MODULE__{code: String.t(), conversion_rate: String.t()}

  defstruct [:code, :conversion_rate]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: :string, conversion_rate: :string]
  end
end
