defmodule Lago.CustomerBillingConfiguration do
  @moduledoc """
  Provides struct and type for a CustomerBillingConfiguration
  """

  @type t :: %__MODULE__{
          document_locale: String.t() | nil,
          invoice_grace_period: integer | nil,
          payment_provider: String.t() | nil,
          payment_provider_code: String.t() | nil,
          provider_customer_id: String.t() | nil,
          provider_payment_methods: [String.t()] | nil,
          subscription_invoice_issuing_date_adjustment: String.t() | nil,
          subscription_invoice_issuing_date_anchor: String.t() | nil,
          sync: boolean | nil,
          sync_with_provider: boolean | nil
        }

  defstruct [
    :document_locale,
    :invoice_grace_period,
    :payment_provider,
    :payment_provider_code,
    :provider_customer_id,
    :provider_payment_methods,
    :subscription_invoice_issuing_date_adjustment,
    :subscription_invoice_issuing_date_anchor,
    :sync,
    :sync_with_provider
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      document_locale: :string,
      invoice_grace_period: :integer,
      payment_provider: {:enum, ["stripe", "adyen", "gocardless"]},
      payment_provider_code: :string,
      provider_customer_id: :string,
      provider_payment_methods: {:union, [[:string], :null]},
      subscription_invoice_issuing_date_adjustment:
        {:enum, ["align_with_finalization_date", "keep_anchor", nil]},
      subscription_invoice_issuing_date_anchor:
        {:enum, ["current_period_end", "next_period_start", nil]},
      sync: :boolean,
      sync_with_provider: :boolean
    ]
  end
end
