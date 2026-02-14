defmodule Lago.CustomerObjectExtended do
  @moduledoc """
  Provides struct and type for a CustomerObjectExtended
  """

  @type t :: %__MODULE__{
          applicable_invoice_custom_sections: [Lago.InvoiceCustomSectionObject.t()] | nil,
          metadata: [Lago.CustomerMetadata.t()] | nil,
          taxes: [Lago.TaxObject.t()] | nil
        }

  defstruct [:applicable_invoice_custom_sections, :metadata, :taxes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applicable_invoice_custom_sections: [{Lago.InvoiceCustomSectionObject, :t}],
      metadata: [{Lago.CustomerMetadata, :t}],
      taxes: [{Lago.TaxObject, :t}]
    ]
  end
end
