defmodule Lago.WalletTransactionObject do
  @moduledoc """
  Provides struct and type for a WalletTransactionObject
  """

  @type t :: %__MODULE__{
          amount: String.t(),
          created_at: DateTime.t(),
          credit_amount: String.t(),
          failed_at: DateTime.t() | nil,
          invoice_requires_successful_payment: boolean | nil,
          lago_id: String.t(),
          lago_wallet_id: String.t(),
          metadata: [Lago.WalletTransactionObjectMetadata.t()] | nil,
          name: String.t() | nil,
          settled_at: DateTime.t() | nil,
          source: String.t(),
          status: String.t(),
          transaction_status: String.t(),
          transaction_type: String.t()
        }

  defstruct [
    :amount,
    :created_at,
    :credit_amount,
    :failed_at,
    :invoice_requires_successful_payment,
    :lago_id,
    :lago_wallet_id,
    :metadata,
    :name,
    :settled_at,
    :source,
    :status,
    :transaction_status,
    :transaction_type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: :string,
      created_at: {:string, "date-time"},
      credit_amount: :string,
      failed_at: {:union, [{:string, "date-time"}, :null]},
      invoice_requires_successful_payment: :boolean,
      lago_id: {:string, "uuid"},
      lago_wallet_id: {:string, "uuid"},
      metadata: [{Lago.WalletTransactionObjectMetadata, :t}],
      name: {:union, [:string, :null]},
      settled_at: {:union, [{:string, "date-time"}, :null]},
      source: {:enum, ["manual", "interval", "threshold"]},
      status: {:enum, ["pending", "settled", "failed"]},
      transaction_status: {:enum, ["purchased", "granted", "voided", "invoiced"]},
      transaction_type: {:enum, ["inbound", "outbound"]}
    ]
  end
end
