defmodule Lago.PaymentReceipt do
  @moduledoc """
  Provides struct and type for a PaymentReceipt
  """

  @type t :: %__MODULE__{payment_receipt: Lago.PaymentReceiptObject.t()}

  defstruct [:payment_receipt]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [payment_receipt: {Lago.PaymentReceiptObject, :t}]
  end
end
