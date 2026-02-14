defmodule Lago.Customer do
  @moduledoc """
  Provides struct and type for a Customer
  """

  @type t :: %__MODULE__{customer: Lago.CustomerObjectExtended.t()}

  defstruct [:customer]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [customer: {Lago.CustomerObjectExtended, :t}]
  end
end
