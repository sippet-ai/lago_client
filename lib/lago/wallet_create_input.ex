defmodule Lago.WalletCreateInput do
  @moduledoc """
  Provides struct and type for a WalletCreateInput
  """

  @type t :: %__MODULE__{wallet: Lago.WalletCreateInputWallet.t() | nil}

  defstruct [:wallet]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [wallet: {Lago.WalletCreateInputWallet, :t}]
  end
end
