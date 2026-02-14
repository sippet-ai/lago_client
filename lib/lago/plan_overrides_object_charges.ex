defmodule Lago.PlanOverridesObjectCharges do
  @moduledoc """
  Provides struct and type for a PlanOverridesObjectCharges
  """

  @type t :: %__MODULE__{
          applied_pricing_unit: Lago.PlanOverridesObjectChargesAppliedPricingUnit.t() | nil,
          billable_metric_id: String.t() | nil,
          charge_model: String.t() | nil,
          filters: [Lago.ChargeFilterInput.t()] | nil,
          id: String.t() | nil,
          invoice_display_name: String.t() | nil,
          min_amount_cents: integer | nil,
          properties: Lago.ChargeProperties.t() | nil,
          tax_codes: [String.t()] | nil
        }

  defstruct [
    :applied_pricing_unit,
    :billable_metric_id,
    :charge_model,
    :filters,
    :id,
    :invoice_display_name,
    :min_amount_cents,
    :properties,
    :tax_codes
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applied_pricing_unit: {Lago.PlanOverridesObjectChargesAppliedPricingUnit, :t},
      billable_metric_id: {:string, "uuid"},
      charge_model:
        {:enum,
         [
           "dynamic",
           "graduated",
           "graduated_percentage",
           "package",
           "percentage",
           "standard",
           "volume"
         ]},
      filters: [{Lago.ChargeFilterInput, :t}],
      id: {:string, "uuid"},
      invoice_display_name: :string,
      min_amount_cents: :integer,
      properties: {Lago.ChargeProperties, :t},
      tax_codes: [:string]
    ]
  end
end
