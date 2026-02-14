defmodule Lago.PlanCreateInputPlanCharges do
  @moduledoc """
  Provides struct and type for a PlanCreateInputPlanCharges
  """

  @type t :: %__MODULE__{
          accepts_target_wallet: boolean | nil,
          applied_pricing_unit: Lago.PlanCreateInputPlanChargesAppliedPricingUnit.t() | nil,
          billable_metric_id: String.t(),
          charge_model: String.t(),
          filters: [Lago.ChargeFilterInput.t()] | nil,
          invoice_display_name: String.t() | nil,
          invoiceable: boolean | nil,
          min_amount_cents: integer | nil,
          pay_in_advance: boolean | nil,
          properties: Lago.ChargeProperties.t() | nil,
          prorated: boolean | nil,
          regroup_paid_fees: String.t() | nil,
          tax_codes: [String.t()] | nil
        }

  defstruct [
    :accepts_target_wallet,
    :applied_pricing_unit,
    :billable_metric_id,
    :charge_model,
    :filters,
    :invoice_display_name,
    :invoiceable,
    :min_amount_cents,
    :pay_in_advance,
    :properties,
    :prorated,
    :regroup_paid_fees,
    :tax_codes
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      accepts_target_wallet: {:union, [:boolean, :null]},
      applied_pricing_unit: {Lago.PlanCreateInputPlanChargesAppliedPricingUnit, :t},
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
      invoice_display_name: :string,
      invoiceable: :boolean,
      min_amount_cents: :integer,
      pay_in_advance: :boolean,
      properties: {Lago.ChargeProperties, :t},
      prorated: :boolean,
      regroup_paid_fees: {:enum, [nil, "invoice"]},
      tax_codes: [:string]
    ]
  end
end
