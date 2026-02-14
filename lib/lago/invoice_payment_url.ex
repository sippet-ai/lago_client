defmodule Lago.InvoicePaymentUrl do
  @moduledoc """
  Provides struct and type for a InvoicePaymentUrl
  """

  @type t :: %__MODULE__{
          invoice_payment_details: Lago.InvoicePaymentUrlInvoicePaymentDetails.t() | nil
        }

  defstruct [:invoice_payment_details]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoice_payment_details: {Lago.InvoicePaymentUrlInvoicePaymentDetails, :t}]
  end
end
