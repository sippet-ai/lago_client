defmodule Lago.PaymentReceiptsPaginated do
  @moduledoc """
  Provides struct and type for a PaymentReceiptsPaginated
  """

  @type t :: %__MODULE__{
          meta: Lago.PaginationMeta.t(),
          payment_receipts: [Lago.PaymentReceiptObject.t()]
        }

  defstruct [:meta, :payment_receipts]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {Lago.PaginationMeta, :t}, payment_receipts: [{Lago.PaymentReceiptObject, :t}]]
  end
end
