defmodule Lago.AddOnsPaginated do
  @moduledoc """
  Provides struct and type for a AddOnsPaginated
  """

  @type t :: %__MODULE__{add_ons: [Lago.AddOnObject.t()], meta: Lago.PaginationMeta.t()}

  defstruct [:add_ons, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [add_ons: [{Lago.AddOnObject, :t}], meta: {Lago.PaginationMeta, :t}]
  end
end
