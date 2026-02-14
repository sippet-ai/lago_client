defmodule Lago.Payment do
  @moduledoc """
  Provides struct and type for a Payment
  """

  @type t :: %__MODULE__{payment: Lago.PaymentObject.t()}

  defstruct [:payment]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [payment: {Lago.PaymentObject, :t}]
  end
end
