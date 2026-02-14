defmodule Lago.WalletTransactionsPaginated do
  @moduledoc """
  Provides struct and type for a WalletTransactionsPaginated
  """

  @type t :: %__MODULE__{
          meta: Lago.PaginationMeta.t() | nil,
          wallet_transactions: [Lago.WalletTransactionObject.t()] | nil
        }

  defstruct [:meta, :wallet_transactions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {Lago.PaginationMeta, :t}, wallet_transactions: [{Lago.WalletTransactionObject, :t}]]
  end
end
