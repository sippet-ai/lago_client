defmodule Lago.BillableMetricEvaluateExpressionInputEvent do
  @moduledoc """
  Provides struct and type for a BillableMetricEvaluateExpressionInputEvent
  """

  @type t :: %__MODULE__{code: String.t(), properties: map, timestamp: integer | String.t() | nil}

  defstruct [:code, :properties, :timestamp]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: :string, properties: :map, timestamp: {:union, [:integer, :string]}]
  end
end
