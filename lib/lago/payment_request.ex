defmodule Lago.PaymentRequest do
  @moduledoc """
  Provides struct and type for a PaymentRequest
  """

  @type t :: %__MODULE__{payment_request: Lago.PaymentRequestObject.t()}

  defstruct [:payment_request]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [payment_request: {Lago.PaymentRequestObject, :t}]
  end
end
