defmodule Lago.TaxesPaginated do
  @moduledoc """
  Provides struct and type for a TaxesPaginated
  """

  @type t :: %__MODULE__{meta: Lago.PaginationMeta.t(), taxes: [Lago.TaxObject.t()]}

  defstruct [:meta, :taxes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {Lago.PaginationMeta, :t}, taxes: [{Lago.TaxObject, :t}]]
  end
end
