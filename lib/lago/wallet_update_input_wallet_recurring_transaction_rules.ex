defmodule Lago.WalletUpdateInputWalletRecurringTransactionRules do
  @moduledoc """
  Provides struct and type for a WalletUpdateInputWalletRecurringTransactionRules
  """

  @type t :: %__MODULE__{
          expiration_at: DateTime.t() | nil,
          granted_credits: String.t() | nil,
          interval: String.t() | nil,
          invoice_requires_successful_payment: boolean | nil,
          lago_id: String.t() | nil,
          method: String.t() | nil,
          paid_credits: String.t() | nil,
          started_at: DateTime.t() | nil,
          target_ongoing_balance: String.t() | nil,
          threshold_credits: String.t() | nil,
          transaction_metadata:
            [Lago.WalletUpdateInputWalletRecurringTransactionRulesTransactionMetadata.t()] | nil,
          transaction_name: String.t() | nil,
          trigger: String.t() | nil
        }

  defstruct [
    :expiration_at,
    :granted_credits,
    :interval,
    :invoice_requires_successful_payment,
    :lago_id,
    :method,
    :paid_credits,
    :started_at,
    :target_ongoing_balance,
    :threshold_credits,
    :transaction_metadata,
    :transaction_name,
    :trigger
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      expiration_at: {:union, [{:string, "date-time"}, :null]},
      granted_credits: {:union, [:string, :null]},
      interval: {:enum, ["weekly", "monthly", "quarterly", "semiannual", "yearly"]},
      invoice_requires_successful_payment: :boolean,
      lago_id: {:string, "uuid"},
      method: {:enum, ["fixed", "target"]},
      paid_credits: {:union, [:string, :null]},
      started_at: {:union, [{:string, "date-time"}, :null]},
      target_ongoing_balance: :string,
      threshold_credits: :string,
      transaction_metadata: [
        {Lago.WalletUpdateInputWalletRecurringTransactionRulesTransactionMetadata, :t}
      ],
      transaction_name: {:union, [:string, :null]},
      trigger: {:enum, ["interval", "threshold"]}
    ]
  end
end
