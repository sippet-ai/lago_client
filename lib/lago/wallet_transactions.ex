defmodule Lago.WalletTransactions do
  @moduledoc """
  Provides struct and type for a WalletTransactions
  """

  @type t :: %__MODULE__{wallet_transactions: [Lago.WalletTransactionObject.t()]}

  defstruct [:wallet_transactions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [wallet_transactions: [{Lago.WalletTransactionObject, :t}]]
  end
end
