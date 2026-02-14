defmodule Lago.PaymentRequestsPaginated do
  @moduledoc """
  Provides struct and type for a PaymentRequestsPaginated
  """

  @type t :: %__MODULE__{
          meta: Lago.PaginationMeta.t(),
          payment_requests: [Lago.PaymentRequestObject.t()]
        }

  defstruct [:meta, :payment_requests]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {Lago.PaginationMeta, :t}, payment_requests: [{Lago.PaymentRequestObject, :t}]]
  end
end
