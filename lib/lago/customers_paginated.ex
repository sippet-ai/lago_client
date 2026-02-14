defmodule Lago.CustomersPaginated do
  @moduledoc """
  Provides struct and type for a CustomersPaginated
  """

  @type t :: %__MODULE__{
          customers: [Lago.CustomerObjectExtended.t()],
          meta: Lago.PaginationMeta.t()
        }

  defstruct [:customers, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [customers: [{Lago.CustomerObjectExtended, :t}], meta: {Lago.PaginationMeta, :t}]
  end
end
