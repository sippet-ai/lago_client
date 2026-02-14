defmodule Lago.CustomerCheckoutUrl do
  @moduledoc """
  Provides struct and type for a CustomerCheckoutUrl
  """

  @type t :: %__MODULE__{customer: Lago.CustomerCheckoutUrlCustomer.t() | nil}

  defstruct [:customer]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [customer: {Lago.CustomerCheckoutUrlCustomer, :t}]
  end
end
