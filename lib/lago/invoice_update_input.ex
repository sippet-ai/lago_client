defmodule Lago.InvoiceUpdateInput do
  @moduledoc """
  Provides struct and type for a InvoiceUpdateInput
  """

  @type t :: %__MODULE__{invoice: Lago.InvoiceUpdateInputInvoice.t()}

  defstruct [:invoice]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoice: {Lago.InvoiceUpdateInputInvoice, :t}]
  end
end
