defmodule Lago.BillableMetricFilterObject do
  @moduledoc """
  Provides struct and type for a BillableMetricFilterObject
  """

  @type t :: %__MODULE__{key: String.t(), values: [String.t()]}

  defstruct [:key, :values]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [key: :string, values: [:string]]
  end
end
