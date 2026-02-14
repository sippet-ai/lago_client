defmodule Lago.CustomerPastUsage do
  @moduledoc """
  Provides struct and type for a CustomerPastUsage
  """

  @type t :: %__MODULE__{meta: Lago.PaginationMeta.t(), usage_periods: [Lago.CustomerUsage.t()]}

  defstruct [:meta, :usage_periods]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {Lago.PaginationMeta, :t}, usage_periods: [{Lago.CustomerUsage, :t}]]
  end
end
