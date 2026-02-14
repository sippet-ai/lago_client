defmodule Lago.PaymentRequestCreateInputPaymentRequest do
  @moduledoc """
  Provides struct and type for a PaymentRequestCreateInputPaymentRequest
  """

  @type t :: %__MODULE__{
          email: String.t(),
          external_customer_id: String.t(),
          lago_invoice_ids: [String.t()]
        }

  defstruct [:email, :external_customer_id, :lago_invoice_ids]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [email: {:string, "email"}, external_customer_id: :string, lago_invoice_ids: [:string]]
  end
end
