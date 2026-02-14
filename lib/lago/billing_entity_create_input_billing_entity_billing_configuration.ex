defmodule Lago.BillingEntityCreateInputBillingEntityBillingConfiguration do
  @moduledoc """
  Provides struct and type for a BillingEntityCreateInputBillingEntityBillingConfiguration
  """

  @type t :: %__MODULE__{
          document_locale: String.t() | nil,
          invoice_footer: String.t() | nil,
          invoice_grace_period: integer | nil,
          subscription_invoice_issuing_date_adjustment: String.t() | nil,
          subscription_invoice_issuing_date_anchor: String.t() | nil
        }

  defstruct [
    :document_locale,
    :invoice_footer,
    :invoice_grace_period,
    :subscription_invoice_issuing_date_adjustment,
    :subscription_invoice_issuing_date_anchor
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      document_locale: :string,
      invoice_footer: :string,
      invoice_grace_period: :integer,
      subscription_invoice_issuing_date_adjustment:
        {:enum, ["align_with_finalization_date", "keep_anchor"]},
      subscription_invoice_issuing_date_anchor:
        {:enum, ["current_period_end", "next_period_start"]}
    ]
  end
end
