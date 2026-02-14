defmodule Lago.WalletRecurringTransactionRule do
  @moduledoc """
  Provides struct and type for a WalletRecurringTransactionRule
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          expiration_at: DateTime.t() | nil,
          granted_credits: String.t(),
          ignore_paid_top_up_limits: boolean,
          interval: String.t(),
          invoice_requires_successful_payment: boolean,
          lago_id: String.t(),
          method: String.t(),
          paid_credits: String.t(),
          started_at: DateTime.t() | nil,
          status: String.t(),
          target_ongoing_balance: String.t() | nil,
          threshold_credits: String.t(),
          transaction_metadata: [Lago.WalletRecurringTransactionRuleTransactionMetadata.t()],
          transaction_name: String.t() | nil,
          trigger: String.t()
        }

  defstruct [
    :created_at,
    :expiration_at,
    :granted_credits,
    :ignore_paid_top_up_limits,
    :interval,
    :invoice_requires_successful_payment,
    :lago_id,
    :method,
    :paid_credits,
    :started_at,
    :status,
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
      created_at: {:string, "date-time"},
      expiration_at: {:union, [{:string, "date-time"}, :null]},
      granted_credits: :string,
      ignore_paid_top_up_limits: :boolean,
      interval: {:enum, ["weekly", "monthly", "quarterly", "semiannual", "yearly"]},
      invoice_requires_successful_payment: :boolean,
      lago_id: {:string, "uuid"},
      method: {:enum, ["fixed", "target"]},
      paid_credits: :string,
      started_at: {:union, [{:string, "date-time"}, :null]},
      status: {:enum, ["active", "terminated"]},
      target_ongoing_balance: {:union, [:string, :null]},
      threshold_credits: :string,
      transaction_metadata: [{Lago.WalletRecurringTransactionRuleTransactionMetadata, :t}],
      transaction_name: {:union, [:string, :null]},
      trigger: {:enum, ["interval", "threshold"]}
    ]
  end
end
