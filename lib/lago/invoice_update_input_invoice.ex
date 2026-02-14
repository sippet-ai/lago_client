defmodule Lago.InvoiceUpdateInputInvoice do
  @moduledoc """
  Provides struct and type for a InvoiceUpdateInputInvoice
  """

  @type t :: %__MODULE__{
          metadata: [Lago.InvoiceUpdateInputInvoiceMetadata.t()] | nil,
          payment_status: String.t() | nil
        }

  defstruct [:metadata, :payment_status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      metadata: [{Lago.InvoiceUpdateInputInvoiceMetadata, :t}],
      payment_status: {:enum, ["pending", "succeeded", "failed"]}
    ]
  end
end
