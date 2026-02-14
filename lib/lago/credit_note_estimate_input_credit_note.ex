defmodule Lago.CreditNoteEstimateInputCreditNote do
  @moduledoc """
  Provides struct and type for a CreditNoteEstimateInputCreditNote
  """

  @type t :: %__MODULE__{
          invoice_id: String.t(),
          items: [Lago.CreditNoteEstimateInputCreditNoteItems.t()]
        }

  defstruct [:invoice_id, :items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoice_id: {:string, "uuid"}, items: [{Lago.CreditNoteEstimateInputCreditNoteItems, :t}]]
  end
end
