defmodule Lago.PlansPaginated do
  @moduledoc """
  Provides struct and type for a PlansPaginated
  """

  @type t :: %__MODULE__{meta: Lago.PaginationMeta.t(), plans: [Lago.PlanObject.t()]}

  defstruct [:meta, :plans]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {Lago.PaginationMeta, :t}, plans: [{Lago.PlanObject, :t}]]
  end
end
