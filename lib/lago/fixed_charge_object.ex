defmodule Lago.FixedChargeObject do
  @moduledoc """
  Provides struct and type for a FixedChargeObject
  """

  @type t :: %__MODULE__{
          add_on_code: String.t(),
          charge_model: String.t(),
          code: String.t() | nil,
          created_at: DateTime.t(),
          invoice_display_name: String.t(),
          lago_add_on_id: String.t(),
          lago_id: String.t(),
          lago_parent_id: String.t() | nil,
          pay_in_advance: boolean,
          properties: Lago.FixedChargeProperties.t(),
          prorated: boolean,
          taxes: [Lago.TaxObject.t()] | nil,
          units: number
        }

  defstruct [
    :add_on_code,
    :charge_model,
    :code,
    :created_at,
    :invoice_display_name,
    :lago_add_on_id,
    :lago_id,
    :lago_parent_id,
    :pay_in_advance,
    :properties,
    :prorated,
    :taxes,
    :units
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      add_on_code: :string,
      charge_model: {:enum, ["standard", "graduated", "volume"]},
      code: :string,
      created_at: {:string, "date-time"},
      invoice_display_name: :string,
      lago_add_on_id: {:string, "uuid"},
      lago_id: {:string, "uuid"},
      lago_parent_id: {:union, [{:string, "uuid"}, :null]},
      pay_in_advance: :boolean,
      properties: {Lago.FixedChargeProperties, :t},
      prorated: :boolean,
      taxes: [{Lago.TaxObject, :t}],
      units: :number
    ]
  end
end
