defmodule Lago.Fee do
  @moduledoc """
  Provides struct and type for a Fee
  """

  @type t :: %__MODULE__{fee: Lago.FeeObject.t()}

  defstruct [:fee]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [fee: {Lago.FeeObject, :t}]
  end
end
