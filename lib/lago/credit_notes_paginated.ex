defmodule Lago.CreditNotesPaginated do
  @moduledoc """
  Provides struct and type for a CreditNotesPaginated
  """

  @type t :: %__MODULE__{credit_notes: [Lago.CreditNoteObject.t()], meta: Lago.PaginationMeta.t()}

  defstruct [:credit_notes, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [credit_notes: [{Lago.CreditNoteObject, :t}], meta: {Lago.PaginationMeta, :t}]
  end
end
