defmodule Lago.WalletsPaginated do
  @moduledoc """
  Provides struct and type for a WalletsPaginated
  """

  @type t :: %__MODULE__{meta: Lago.PaginationMeta.t(), wallets: [Lago.WalletObject.t()]}

  defstruct [:meta, :wallets]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {Lago.PaginationMeta, :t}, wallets: [{Lago.WalletObject, :t}]]
  end
end
