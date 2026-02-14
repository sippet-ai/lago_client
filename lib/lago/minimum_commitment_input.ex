defmodule Lago.MinimumCommitmentInput do
  @moduledoc """
  Provides struct and type for a MinimumCommitmentInput
  """

  @type t :: %__MODULE__{
          amount_cents: integer,
          invoice_display_name: String.t() | nil,
          tax_codes: [String.t()] | nil
        }

  defstruct [:amount_cents, :invoice_display_name, :tax_codes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [amount_cents: :integer, invoice_display_name: :string, tax_codes: [:string]]
  end
end
