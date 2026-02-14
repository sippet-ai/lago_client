defmodule Lago.MinimumCommitmentObject do
  @moduledoc """
  Provides struct and type for a MinimumCommitmentObject
  """

  @type t :: %__MODULE__{
          amount_cents: integer,
          created_at: DateTime.t(),
          interval: String.t() | nil,
          invoice_display_name: String.t() | nil,
          lago_id: String.t(),
          plan_code: String.t() | nil,
          taxes: [Lago.TaxObject.t()] | nil,
          updated_at: DateTime.t() | nil
        }

  defstruct [
    :amount_cents,
    :created_at,
    :interval,
    :invoice_display_name,
    :lago_id,
    :plan_code,
    :taxes,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      created_at: {:string, "date-time"},
      interval: {:enum, ["weekly", "monthly", "quarterly", "semiannual", "yearly"]},
      invoice_display_name: :string,
      lago_id: {:string, "uuid"},
      plan_code: :string,
      taxes: [{Lago.TaxObject, :t}],
      updated_at: {:string, "date-time"}
    ]
  end
end
