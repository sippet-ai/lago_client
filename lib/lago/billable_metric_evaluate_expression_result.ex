defmodule Lago.BillableMetricEvaluateExpressionResult do
  @moduledoc """
  Provides struct and type for a BillableMetricEvaluateExpressionResult
  """

  @type t :: %__MODULE__{
          expression_result: Lago.BillableMetricEvaluateExpressionResultExpressionResult.t()
        }

  defstruct [:expression_result]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [expression_result: {Lago.BillableMetricEvaluateExpressionResultExpressionResult, :t}]
  end
end
