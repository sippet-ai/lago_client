defmodule Lago.CreditNoteCreateInputCreditNote do
  @moduledoc """
  Provides struct and type for a CreditNoteCreateInputCreditNote
  """

  @type t :: %__MODULE__{
          credit_amount_cents: integer | nil,
          description: String.t() | nil,
          invoice_id: String.t(),
          items: [Lago.CreditNoteCreateInputCreditNoteItems.t()],
          metadata: map | nil,
          offset_amount_cents: integer | nil,
          reason: String.t() | nil,
          refund_amount_cents: integer | nil
        }

  defstruct [
    :credit_amount_cents,
    :description,
    :invoice_id,
    :items,
    :metadata,
    :offset_amount_cents,
    :reason,
    :refund_amount_cents
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      credit_amount_cents: {:union, [:integer, :null]},
      description: :string,
      invoice_id: {:string, "uuid"},
      items: [{Lago.CreditNoteCreateInputCreditNoteItems, :t}],
      metadata: :map,
      offset_amount_cents: {:union, [:integer, :null]},
      reason:
        {:enum,
         [
           "duplicated_charge",
           "product_unsatisfactory",
           "order_change",
           "order_cancellation",
           "fraudulent_charge",
           "other",
           nil
         ]},
      refund_amount_cents: {:union, [:integer, :null]}
    ]
  end
end
