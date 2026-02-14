defmodule Lago.BillableMetricsPaginated do
  @moduledoc """
  Provides struct and type for a BillableMetricsPaginated
  """

  @type t :: %__MODULE__{
          billable_metrics: [Lago.BillableMetricObject.t()],
          meta: Lago.PaginationMeta.t()
        }

  defstruct [:billable_metrics, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [billable_metrics: [{Lago.BillableMetricObject, :t}], meta: {Lago.PaginationMeta, :t}]
  end
end
