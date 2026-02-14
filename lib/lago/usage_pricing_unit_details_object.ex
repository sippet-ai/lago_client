defmodule Lago.UsagePricingUnitDetailsObject do
  @moduledoc """
  Provides struct and type for a UsagePricingUnitDetailsObject
  """

  @type t :: %__MODULE__{
          amount_cents: integer,
          conversion_rate: String.t(),
          short_name: String.t()
        }

  defstruct [:amount_cents, :conversion_rate, :short_name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [amount_cents: :integer, conversion_rate: :string, short_name: :string]
  end
end
