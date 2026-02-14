defmodule Lago.InvoiceCollections do
  @moduledoc """
  Provides struct and type for a InvoiceCollections
  """

  @type t :: %__MODULE__{invoice_collections: [Lago.InvoiceCollectionObject.t()]}

  defstruct [:invoice_collections]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoice_collections: [{Lago.InvoiceCollectionObject, :t}]]
  end
end
