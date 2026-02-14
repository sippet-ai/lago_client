defmodule Lago.CustomerChargeGroupedUsageObject do
  @moduledoc """
  Provides struct and type for a CustomerChargeGroupedUsageObject
  """

  @type t :: %__MODULE__{
          amount_cents: integer | nil,
          events_count: integer | nil,
          filters: [Lago.CustomerChargeFiltersUsageObject.t()] | nil,
          grouped_by: map | nil,
          pricing_unit_details: Lago.UsagePricingUnitDetailsObject.t() | nil,
          total_aggregated_units: String.t() | nil,
          units: String.t() | nil
        }

  defstruct [
    :amount_cents,
    :events_count,
    :filters,
    :grouped_by,
    :pricing_unit_details,
    :total_aggregated_units,
    :units
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      events_count: :integer,
      filters: [{Lago.CustomerChargeFiltersUsageObject, :t}],
      grouped_by: :map,
      pricing_unit_details: {:union, [{Lago.UsagePricingUnitDetailsObject, :t}, :null]},
      total_aggregated_units: :string,
      units: :string
    ]
  end
end
