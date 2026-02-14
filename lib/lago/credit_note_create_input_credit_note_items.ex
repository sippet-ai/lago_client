defmodule Lago.CreditNoteCreateInputCreditNoteItems do
  @moduledoc """
  Provides struct and type for a CreditNoteCreateInputCreditNoteItems
  """

  @type t :: %__MODULE__{amount_cents: integer, fee_id: String.t()}

  defstruct [:amount_cents, :fee_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [amount_cents: :integer, fee_id: {:string, "uuid"}]
  end
end
