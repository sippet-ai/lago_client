defmodule Lago.PlanCreateInputPlanFixedCharges do
  @moduledoc """
  Provides struct and type for a PlanCreateInputPlanFixedCharges
  """

  @type t :: %__MODULE__{
          add_on_id: String.t(),
          charge_model: String.t(),
          code: String.t() | nil,
          invoice_display_name: String.t() | nil,
          pay_in_advance: boolean | nil,
          properties: Lago.FixedChargeProperties.t() | nil,
          prorated: boolean | nil,
          tax_codes: [String.t()] | nil,
          units: number | nil
        }

  defstruct [
    :add_on_id,
    :charge_model,
    :code,
    :invoice_display_name,
    :pay_in_advance,
    :properties,
    :prorated,
    :tax_codes,
    :units
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      add_on_id: {:string, "uuid"},
      charge_model: {:enum, ["standard", "graduated", "volume"]},
      code: :string,
      invoice_display_name: :string,
      pay_in_advance: :boolean,
      properties: {Lago.FixedChargeProperties, :t},
      prorated: :boolean,
      tax_codes: [:string],
      units: :number
    ]
  end
end
