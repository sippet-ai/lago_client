defmodule Lago.WalletMetadataResponse do
  @moduledoc """
  Provides struct and type for a WalletMetadataResponse
  """

  @type t :: %__MODULE__{metadata: map | nil}

  defstruct [:metadata]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [metadata: {:union, [:map, :null]}]
  end
end
