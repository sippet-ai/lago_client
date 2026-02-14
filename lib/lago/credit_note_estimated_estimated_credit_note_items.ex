defmodule Lago.CreditNoteEstimatedEstimatedCreditNoteItems do
  @moduledoc """
  Provides struct and type for a CreditNoteEstimatedEstimatedCreditNoteItems
  """

  @type t :: %__MODULE__{amount_cents: integer, lago_fee_id: String.t() | nil}

  defstruct [:amount_cents, :lago_fee_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [amount_cents: :integer, lago_fee_id: {:union, [{:string, "uuid"}, :null]}]
  end
end
