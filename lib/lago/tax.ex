defmodule Lago.Tax do
  @moduledoc """
  Provides struct and type for a Tax
  """

  @type t :: %__MODULE__{tax: Lago.TaxObject.t()}

  defstruct [:tax]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tax: {Lago.TaxObject, :t}]
  end
end
