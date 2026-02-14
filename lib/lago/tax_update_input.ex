defmodule Lago.TaxUpdateInput do
  @moduledoc """
  Provides struct and type for a TaxUpdateInput
  """

  @type t :: %__MODULE__{tax: Lago.TaxBaseInput.t()}

  defstruct [:tax]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tax: {Lago.TaxBaseInput, :t}]
  end
end
