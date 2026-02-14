defmodule Lago.WalletUpdateInputWallet do
  @moduledoc """
  Provides struct and type for a WalletUpdateInputWallet
  """

  @type t :: %__MODULE__{
          applies_to: Lago.WalletUpdateInputWalletAppliesTo.t() | nil,
          code: String.t() | nil,
          expiration_at: DateTime.t() | nil,
          invoice_requires_successful_payment: boolean | nil,
          metadata: map | nil,
          name: String.t() | nil,
          priority: integer | nil,
          recurring_transaction_rules:
            [Lago.WalletUpdateInputWalletRecurringTransactionRules.t()] | nil
        }

  defstruct [
    :applies_to,
    :code,
    :expiration_at,
    :invoice_requires_successful_payment,
    :metadata,
    :name,
    :priority,
    :recurring_transaction_rules
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applies_to: {:union, [{Lago.WalletUpdateInputWalletAppliesTo, :t}, :null]},
      code: {:union, [:string, :null]},
      expiration_at: {:union, [{:string, "date-time"}, :null]},
      invoice_requires_successful_payment: :boolean,
      metadata: :map,
      name: {:union, [:string, :null]},
      priority: :integer,
      recurring_transaction_rules: [{Lago.WalletUpdateInputWalletRecurringTransactionRules, :t}]
    ]
  end
end
