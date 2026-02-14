defmodule Lago.FeeUpdateInput do
  @moduledoc """
  Provides struct and type for a FeeUpdateInput
  """

  @type t :: %__MODULE__{fee: Lago.FeeUpdateInputFee.t()}

  defstruct [:fee]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [fee: {Lago.FeeUpdateInputFee, :t}]
  end
end
