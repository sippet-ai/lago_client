defmodule Lago.FixedCharges do
  @moduledoc """
  Provides struct and type for a FixedCharges
  """

  @type t :: %__MODULE__{fixed_charges: [Lago.FixedChargeObject.t()]}

  defstruct [:fixed_charges]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [fixed_charges: [{Lago.FixedChargeObject, :t}]]
  end
end
