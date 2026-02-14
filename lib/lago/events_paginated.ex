defmodule Lago.EventsPaginated do
  @moduledoc """
  Provides struct and type for a EventsPaginated
  """

  @type t :: %__MODULE__{events: [Lago.EventObject.t()], meta: Lago.PaginationMeta.t()}

  defstruct [:events, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [events: [{Lago.EventObject, :t}], meta: {Lago.PaginationMeta, :t}]
  end
end
