defmodule Lago.CreditNoteEstimated do
  @moduledoc """
  Provides struct and type for a CreditNoteEstimated
  """

  @type t :: %__MODULE__{estimated_credit_note: Lago.CreditNoteEstimatedEstimatedCreditNote.t()}

  defstruct [:estimated_credit_note]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [estimated_credit_note: {Lago.CreditNoteEstimatedEstimatedCreditNote, :t}]
  end
end
