defmodule Lago.PaymentCreateInput do
  @moduledoc """
  Provides struct and type for a PaymentCreateInput
  """

  @type t :: %__MODULE__{payment: Lago.PaymentCreateInputPayment.t()}

  defstruct [:payment]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [payment: {Lago.PaymentCreateInputPayment, :t}]
  end
end
