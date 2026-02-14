defmodule Lago.InvoiceOneOffCreateInput do
  @moduledoc """
  Provides struct and type for a InvoiceOneOffCreateInput
  """

  @type t :: %__MODULE__{invoice: Lago.InvoiceOneOffCreateInputInvoice.t()}

  defstruct [:invoice]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoice: {Lago.InvoiceOneOffCreateInputInvoice, :t}]
  end
end
