defmodule Lago.InvoiceVoidInput do
  @moduledoc """
  Provides struct and type for a InvoiceVoidInput
  """

  @type t :: %__MODULE__{
          credit_amount: integer | nil,
          generate_credit_note: boolean | nil,
          refund_amount: integer | nil
        }

  defstruct [:credit_amount, :generate_credit_note, :refund_amount]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [credit_amount: :integer, generate_credit_note: :boolean, refund_amount: :integer]
  end
end
