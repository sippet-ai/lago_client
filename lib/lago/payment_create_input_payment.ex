defmodule Lago.PaymentCreateInputPayment do
  @moduledoc """
  Provides struct and type for a PaymentCreateInputPayment
  """

  @type t :: %__MODULE__{
          amount_cents: integer,
          invoice_id: String.t(),
          paid_at: Date.t() | nil,
          reference: String.t()
        }

  defstruct [:amount_cents, :invoice_id, :paid_at, :reference]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [amount_cents: :integer, invoice_id: :string, paid_at: {:string, "date"}, reference: :string]
  end
end
