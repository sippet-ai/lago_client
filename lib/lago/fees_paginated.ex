defmodule Lago.FeesPaginated do
  @moduledoc """
  Provides struct and type for a FeesPaginated
  """

  @type t :: %__MODULE__{fees: [Lago.FeeObject.t()], meta: Lago.PaginationMeta.t()}

  defstruct [:fees, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [fees: [{Lago.FeeObject, :t}], meta: {Lago.PaginationMeta, :t}]
  end
end
