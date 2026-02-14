defmodule Lago.WalletTransactionCreateInputWalletTransaction do
  @moduledoc """
  Provides struct and type for a WalletTransactionCreateInputWalletTransaction
  """

  @type t :: %__MODULE__{
          granted_credits: String.t() | nil,
          ignore_paid_top_up_limits: boolean | nil,
          invoice_requires_successful_payment: boolean | nil,
          metadata: [map] | nil,
          name: String.t() | nil,
          paid_credits: String.t() | nil,
          voided_credits: String.t() | nil,
          wallet_id: String.t()
        }

  defstruct [
    :granted_credits,
    :ignore_paid_top_up_limits,
    :invoice_requires_successful_payment,
    :metadata,
    :name,
    :paid_credits,
    :voided_credits,
    :wallet_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      granted_credits: {:union, [:string, :null]},
      ignore_paid_top_up_limits: :boolean,
      invoice_requires_successful_payment: :boolean,
      metadata: {:union, [[:map], :null]},
      name: {:union, [:string, :null]},
      paid_credits: {:union, [:string, :null]},
      voided_credits: {:union, [:string, :null]},
      wallet_id: {:string, "uuid"}
    ]
  end
end
