defmodule Lago.InvoiceOneOffCreateInputInvoiceFees do
  @moduledoc """
  Provides struct and type for a InvoiceOneOffCreateInputInvoiceFees
  """

  @type t :: %__MODULE__{
          add_on_code: String.t(),
          description: String.t() | nil,
          from_datetime: DateTime.t() | nil,
          invoice_display_name: String.t() | nil,
          skip_psp: boolean | nil,
          tax_codes: [String.t()] | nil,
          to_datetime: DateTime.t() | nil,
          unit_amount_cents: integer | nil,
          units: String.t() | nil
        }

  defstruct [
    :add_on_code,
    :description,
    :from_datetime,
    :invoice_display_name,
    :skip_psp,
    :tax_codes,
    :to_datetime,
    :unit_amount_cents,
    :units
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      add_on_code: :string,
      description: {:union, [:string, :null]},
      from_datetime: {:string, "date-time"},
      invoice_display_name: :string,
      skip_psp: {:union, [:boolean, :null]},
      tax_codes: [:string],
      to_datetime: {:string, "date-time"},
      unit_amount_cents: {:union, [:integer, :null]},
      units: {:union, [:string, :null]}
    ]
  end
end
