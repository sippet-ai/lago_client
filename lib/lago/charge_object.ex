defmodule Lago.ChargeObject do
  @moduledoc """
  Provides struct and type for a ChargeObject
  """

  @type t :: %__MODULE__{
          accepts_target_wallet: boolean | nil,
          applied_pricing_unit: Lago.ChargeObjectAppliedPricingUnit.t() | nil,
          billable_metric_code: String.t(),
          charge_model: String.t(),
          created_at: DateTime.t(),
          filters: [Lago.ChargeFilterObject.t()],
          invoice_display_name: String.t() | nil,
          invoiceable: boolean,
          lago_billable_metric_id: String.t(),
          lago_id: String.t(),
          min_amount_cents: integer,
          pay_in_advance: boolean,
          properties: Lago.ChargeProperties.t(),
          prorated: boolean,
          regroup_paid_fees: String.t() | nil,
          taxes: [Lago.TaxObject.t()] | nil
        }

  defstruct [
    :accepts_target_wallet,
    :applied_pricing_unit,
    :billable_metric_code,
    :charge_model,
    :created_at,
    :filters,
    :invoice_display_name,
    :invoiceable,
    :lago_billable_metric_id,
    :lago_id,
    :min_amount_cents,
    :pay_in_advance,
    :properties,
    :prorated,
    :regroup_paid_fees,
    :taxes
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      accepts_target_wallet: {:union, [:boolean, :null]},
      applied_pricing_unit: {:union, [{Lago.ChargeObjectAppliedPricingUnit, :t}, :null]},
      billable_metric_code: :string,
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
      created_at: {:string, "date-time"},
      filters: [{Lago.ChargeFilterObject, :t}],
      invoice_display_name: {:union, [:string, :null]},
      invoiceable: :boolean,
      lago_billable_metric_id: {:string, "uuid"},
      lago_id: {:string, "uuid"},
      min_amount_cents: :integer,
      pay_in_advance: :boolean,
      properties: {Lago.ChargeProperties, :t},
      prorated: :boolean,
      regroup_paid_fees: {:enum, [nil, "invoice"]},
      taxes: [{Lago.TaxObject, :t}]
    ]
  end
end
