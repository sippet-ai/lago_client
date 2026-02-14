defmodule Lago.CustomerCreateInput do
  @moduledoc """
  Provides struct and type for a CustomerCreateInput
  """

  @type t :: %__MODULE__{customer: Lago.CustomerCreateInputCustomer.t()}

  defstruct [:customer]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [customer: {Lago.CustomerCreateInputCustomer, :t}]
  end
end
