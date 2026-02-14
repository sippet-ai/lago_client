defmodule Lago.CreditNoteEstimateInput do
  @moduledoc """
  Provides struct and type for a CreditNoteEstimateInput
  """

  @type t :: %__MODULE__{credit_note: Lago.CreditNoteEstimateInputCreditNote.t()}

  defstruct [:credit_note]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [credit_note: {Lago.CreditNoteEstimateInputCreditNote, :t}]
  end
end
