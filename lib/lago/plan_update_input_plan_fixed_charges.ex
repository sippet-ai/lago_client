defmodule Lago.PlanUpdateInputPlanFixedCharges do
  @moduledoc """
  Provides struct and type for a PlanUpdateInputPlanFixedCharges
  """

  @type t :: %__MODULE__{
          add_on_id: String.t() | nil,
          apply_units_immediately: boolean | nil,
          charge_model: String.t() | nil,
          code: String.t() | nil,
          id: String.t() | nil,
          invoice_display_name: String.t() | nil,
          pay_in_advance: boolean | nil,
          properties: Lago.FixedChargeProperties.t() | nil,
          prorated: boolean | nil,
          tax_codes: [String.t()] | nil,
          units: number | nil
        }

  defstruct [
    :add_on_id,
    :apply_units_immediately,
    :charge_model,
    :code,
    :id,
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
      apply_units_immediately: :boolean,
      charge_model: {:enum, ["standard", "graduated", "volume"]},
      code: :string,
      id: {:string, "uuid"},
      invoice_display_name: :string,
      pay_in_advance: :boolean,
      properties: {Lago.FixedChargeProperties, :t},
      prorated: :boolean,
      tax_codes: [:string],
      units: :number
    ]
  end
end
