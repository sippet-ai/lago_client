defmodule Lago.WalletTransactionPaymentUrlWalletTransactionPaymentDetails do
  @moduledoc """
  Provides struct and type for a WalletTransactionPaymentUrlWalletTransactionPaymentDetails
  """

  @type t :: %__MODULE__{
          external_customer_id: String.t() | nil,
          lago_customer_id: String.t() | nil,
          lago_wallet_transaction_id: String.t() | nil,
          payment_provider: String.t() | nil,
          payment_url: String.t() | nil
        }

  defstruct [
    :external_customer_id,
    :lago_customer_id,
    :lago_wallet_transaction_id,
    :payment_provider,
    :payment_url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      external_customer_id: :string,
      lago_customer_id: :string,
      lago_wallet_transaction_id: :string,
      payment_provider: :string,
      payment_url: :string
    ]
  end
end
