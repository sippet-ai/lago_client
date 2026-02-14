defmodule Lago.Wallet do
  @moduledoc """
  Provides struct and type for a Wallet
  """

  @type t :: %__MODULE__{wallet: Lago.WalletObject.t()}

  defstruct [:wallet]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [wallet: {Lago.WalletObject, :t}]
  end
end
