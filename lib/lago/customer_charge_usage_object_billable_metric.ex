defmodule Lago.CustomerChargeUsageObjectBillableMetric do
  @moduledoc """
  Provides struct and type for a CustomerChargeUsageObjectBillableMetric
  """

  @type t :: %__MODULE__{
          aggregation_type: String.t(),
          code: String.t(),
          lago_id: String.t(),
          name: String.t()
        }

  defstruct [:aggregation_type, :code, :lago_id, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      aggregation_type:
        {:enum,
         ["count_agg", "sum_agg", "max_agg", "unique_count_agg", "weighted_sum_agg", "latest_agg"]},
      code: :string,
      lago_id: {:string, "uuid"},
      name: :string
    ]
  end
end
