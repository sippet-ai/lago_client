defmodule Lago.PlanOverridesObjectFixedCharges do
  @moduledoc """
  Provides struct and type for a PlanOverridesObjectFixedCharges
  """

  @type t :: %__MODULE__{
          apply_units_immediately: boolean | nil,
          id: String.t(),
          invoice_display_name: String.t() | nil,
          properties: Lago.FixedChargeProperties.t() | nil,
          tax_codes: [String.t()] | nil,
          units: number | nil
        }

  defstruct [
    :apply_units_immediately,
    :id,
    :invoice_display_name,
    :properties,
    :tax_codes,
    :units
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      apply_units_immediately: :boolean,
      id: {:string, "uuid"},
      invoice_display_name: :string,
      properties: {Lago.FixedChargeProperties, :t},
      tax_codes: [:string],
      units: :number
    ]
  end
end
