defmodule Lago.BillableMetricEvaluateExpressionResultExpressionResult do
  @moduledoc """
  Provides struct and type for a BillableMetricEvaluateExpressionResultExpressionResult
  """

  @type t :: %__MODULE__{value: number | String.t()}

  defstruct [:value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [value: {:union, [:number, :string]}]
  end
end
