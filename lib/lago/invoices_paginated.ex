defmodule Lago.InvoicesPaginated do
  @moduledoc """
  Provides struct and type for a InvoicesPaginated
  """

  @type t :: %__MODULE__{invoices: [Lago.InvoiceObject.t()], meta: Lago.PaginationMeta.t()}

  defstruct [:invoices, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoices: [{Lago.InvoiceObject, :t}], meta: {Lago.PaginationMeta, :t}]
  end
end
