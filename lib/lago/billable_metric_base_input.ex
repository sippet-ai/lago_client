defmodule Lago.BillableMetricBaseInput do
  @moduledoc """
  Provides struct and type for a BillableMetricBaseInput
  """

  @type t :: %__MODULE__{
          aggregation_type: String.t() | nil,
          code: String.t() | nil,
          description: String.t() | nil,
          expression: String.t() | nil,
          field_name: String.t() | nil,
          filters: [Lago.BillableMetricFilterInput.t()] | nil,
          name: String.t() | nil,
          recurring: boolean | nil,
          rounding_function: String.t() | nil,
          rounding_precision: integer | nil,
          weighted_interval: String.t() | nil
        }

  defstruct [
    :aggregation_type,
    :code,
    :description,
    :expression,
    :field_name,
    :filters,
    :name,
    :recurring,
    :rounding_function,
    :rounding_precision,
    :weighted_interval
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      aggregation_type:
        {:enum,
         ["count_agg", "sum_agg", "max_agg", "unique_count_agg", "weighted_sum_agg", "latest_agg"]},
      code: :string,
      description: {:union, [:string, :null]},
      expression: {:union, [:string, :null]},
      field_name: {:union, [:string, :null]},
      filters: [{Lago.BillableMetricFilterInput, :t}],
      name: :string,
      recurring: :boolean,
      rounding_function: {:enum, ["ceil", "floor", "round", nil]},
      rounding_precision: {:union, [:integer, :null]},
      weighted_interval: {:enum, ["seconds", nil]}
    ]
  end
end
