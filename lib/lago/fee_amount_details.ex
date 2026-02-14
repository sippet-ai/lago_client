defmodule Lago.FeeAmountDetails do
  @moduledoc """
  Provides struct and type for a FeeAmountDetails
  """

  @type t :: %__MODULE__{
          fixed_fee_total_amount: String.t() | nil,
          fixed_fee_unit_amount: String.t() | nil,
          flat_unit_amount: String.t() | nil,
          free_events: integer | nil,
          free_units: String.t() | nil,
          graduated_percentage_ranges: [Lago.FeeAmountDetailsGraduatedPercentageRanges.t()] | nil,
          graduated_ranges: [Lago.FeeAmountDetailsGraduatedRanges.t()] | nil,
          min_max_adjustment_total_amount: String.t() | nil,
          paid_events: integer | nil,
          paid_units: String.t() | nil,
          per_package_size: integer | nil,
          per_package_unit_amount: String.t() | nil,
          per_unit_amount: String.t() | nil,
          per_unit_total_amount: String.t() | nil,
          plan_amount_cents: integer | nil,
          rate: String.t() | nil,
          units: String.t() | nil
        }

  defstruct [
    :fixed_fee_total_amount,
    :fixed_fee_unit_amount,
    :flat_unit_amount,
    :free_events,
    :free_units,
    :graduated_percentage_ranges,
    :graduated_ranges,
    :min_max_adjustment_total_amount,
    :paid_events,
    :paid_units,
    :per_package_size,
    :per_package_unit_amount,
    :per_unit_amount,
    :per_unit_total_amount,
    :plan_amount_cents,
    :rate,
    :units
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      fixed_fee_total_amount: :string,
      fixed_fee_unit_amount: :string,
      flat_unit_amount: :string,
      free_events: :integer,
      free_units: :string,
      graduated_percentage_ranges: [{Lago.FeeAmountDetailsGraduatedPercentageRanges, :t}],
      graduated_ranges: [{Lago.FeeAmountDetailsGraduatedRanges, :t}],
      min_max_adjustment_total_amount: :string,
      paid_events: :integer,
      paid_units: :string,
      per_package_size: :integer,
      per_package_unit_amount: :string,
      per_unit_amount: :string,
      per_unit_total_amount: :string,
      plan_amount_cents: :integer,
      rate: {:string, "^[0-9]+.?[0-9]*$"},
      units: :string
    ]
  end
end
