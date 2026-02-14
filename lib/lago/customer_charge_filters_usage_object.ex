defmodule Lago.CustomerChargeFiltersUsageObject do
  @moduledoc """
  Provides struct and type for a CustomerChargeFiltersUsageObject
  """

  @type t :: %__MODULE__{
          amount_cents: integer | nil,
          events_count: integer | nil,
          invoice_display_name: String.t() | nil,
          pricing_unit_details: Lago.UsagePricingUnitDetailsObject.t() | nil,
          total_aggregated_units: String.t() | nil,
          units: String.t() | nil,
          values: map | nil
        }

  defstruct [
    :amount_cents,
    :events_count,
    :invoice_display_name,
    :pricing_unit_details,
    :total_aggregated_units,
    :units,
    :values
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      events_count: :integer,
      invoice_display_name: :string,
      pricing_unit_details: {:union, [{Lago.UsagePricingUnitDetailsObject, :t}, :null]},
      total_aggregated_units: :string,
      units: :string,
      values: :map
    ]
  end
end
