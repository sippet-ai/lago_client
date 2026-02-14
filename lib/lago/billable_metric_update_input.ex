defmodule Lago.BillableMetricUpdateInput do
  @moduledoc """
  Provides struct and type for a BillableMetricUpdateInput
  """

  @type t :: %__MODULE__{billable_metric: Lago.BillableMetricBaseInput.t()}

  defstruct [:billable_metric]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [billable_metric: {Lago.BillableMetricBaseInput, :t}]
  end
end
