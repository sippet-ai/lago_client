defmodule Lago.ChargeProperties do
  @moduledoc """
  Provides struct and type for a ChargeProperties
  """

  @type t :: %__MODULE__{
          amount: String.t() | nil,
          fixed_amount: String.t() | nil,
          free_units: integer | nil,
          free_units_per_events: integer | nil,
          free_units_per_total_aggregation: String.t() | nil,
          graduated_percentage_ranges: [Lago.ChargePropertiesGraduatedPercentageRanges.t()] | nil,
          graduated_ranges: [Lago.ChargePropertiesGraduatedRanges.t()] | nil,
          grouped_by: [String.t()] | nil,
          package_size: integer | nil,
          per_transaction_max_amount: String.t() | nil,
          per_transaction_min_amount: String.t() | nil,
          pricing_group_keys: [String.t()] | nil,
          rate: String.t() | nil,
          volume_ranges: [Lago.ChargePropertiesVolumeRanges.t()] | nil
        }

  defstruct [
    :amount,
    :fixed_amount,
    :free_units,
    :free_units_per_events,
    :free_units_per_total_aggregation,
    :graduated_percentage_ranges,
    :graduated_ranges,
    :grouped_by,
    :package_size,
    :per_transaction_max_amount,
    :per_transaction_min_amount,
    :pricing_group_keys,
    :rate,
    :volume_ranges
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: :string,
      fixed_amount: :string,
      free_units: :integer,
      free_units_per_events: {:union, [:integer, :null]},
      free_units_per_total_aggregation: {:union, [:string, :null]},
      graduated_percentage_ranges: [{Lago.ChargePropertiesGraduatedPercentageRanges, :t}],
      graduated_ranges: [{Lago.ChargePropertiesGraduatedRanges, :t}],
      grouped_by: [:string],
      package_size: :integer,
      per_transaction_max_amount: {:union, [{:string, "^[0-9]+.?[0-9]*$"}, :null]},
      per_transaction_min_amount: {:union, [{:string, "^[0-9]+.?[0-9]*$"}, :null]},
      pricing_group_keys: [:string],
      rate: :string,
      volume_ranges: [{Lago.ChargePropertiesVolumeRanges, :t}]
    ]
  end
end
