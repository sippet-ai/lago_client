defmodule Lago.WalletTransactionPaymentUrl do
  @moduledoc """
  Provides struct and type for a WalletTransactionPaymentUrl
  """

  @type t :: %__MODULE__{
          wallet_transaction_payment_details:
            Lago.WalletTransactionPaymentUrlWalletTransactionPaymentDetails.t() | nil
        }

  defstruct [:wallet_transaction_payment_details]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      wallet_transaction_payment_details:
        {Lago.WalletTransactionPaymentUrlWalletTransactionPaymentDetails, :t}
    ]
  end
end
