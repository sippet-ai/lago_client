defmodule Lago.CreditNoteUpdateInput do
  @moduledoc """
  Provides struct and type for a CreditNoteUpdateInput
  """

  @type t :: %__MODULE__{credit_note: Lago.CreditNoteUpdateInputCreditNote.t()}

  defstruct [:credit_note]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [credit_note: {Lago.CreditNoteUpdateInputCreditNote, :t}]
  end
end
