defmodule Lago.PricingUnitDetailsObject do
  @moduledoc """
  Provides struct and type for a PricingUnitDetailsObject
  """

  @type t :: %__MODULE__{
          amount_cents: integer,
          conversion_rate: String.t(),
          lago_pricing_unit_id: String.t(),
          precise_amount_cents: String.t(),
          precise_unit_amount: String.t(),
          pricing_unit_code: String.t(),
          short_name: String.t(),
          unit_amount_cents: integer
        }

  defstruct [
    :amount_cents,
    :conversion_rate,
    :lago_pricing_unit_id,
    :precise_amount_cents,
    :precise_unit_amount,
    :pricing_unit_code,
    :short_name,
    :unit_amount_cents
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      conversion_rate: :string,
      lago_pricing_unit_id: {:string, "uuid"},
      precise_amount_cents: :string,
      precise_unit_amount: :string,
      pricing_unit_code: :string,
      short_name: :string,
      unit_amount_cents: :integer
    ]
  end
end
