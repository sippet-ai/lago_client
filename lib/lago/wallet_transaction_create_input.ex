defmodule Lago.WalletTransactionCreateInput do
  @moduledoc """
  Provides struct and type for a WalletTransactionCreateInput
  """

  @type t :: %__MODULE__{
          wallet_transaction: Lago.WalletTransactionCreateInputWalletTransaction.t()
        }

  defstruct [:wallet_transaction]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [wallet_transaction: {Lago.WalletTransactionCreateInputWalletTransaction, :t}]
  end
end
