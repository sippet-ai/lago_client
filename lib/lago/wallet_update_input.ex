defmodule Lago.WalletUpdateInput do
  @moduledoc """
  Provides struct and type for a WalletUpdateInput
  """

  @type t :: %__MODULE__{wallet: Lago.WalletUpdateInputWallet.t()}

  defstruct [:wallet]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [wallet: {Lago.WalletUpdateInputWallet, :t}]
  end
end
