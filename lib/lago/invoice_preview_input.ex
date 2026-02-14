defmodule Lago.InvoicePreviewInput do
  @moduledoc """
  Provides struct and type for a InvoicePreviewInput
  """

  @type t :: %__MODULE__{
          billing_entity_code: String.t() | nil,
          billing_time: String.t() | nil,
          coupons: [Lago.InvoicePreviewInputCoupons.t()] | nil,
          customer: Lago.InvoicePreviewInputCustomer.t(),
          plan_code: String.t() | nil,
          subscription_at: DateTime.t() | nil,
          subscriptions: Lago.InvoicePreviewInputSubscriptions.t() | nil
        }

  defstruct [
    :billing_entity_code,
    :billing_time,
    :coupons,
    :customer,
    :plan_code,
    :subscription_at,
    :subscriptions
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billing_entity_code: :string,
      billing_time: {:enum, ["calendar", "anniversary"]},
      coupons: [{Lago.InvoicePreviewInputCoupons, :t}],
      customer: {Lago.InvoicePreviewInputCustomer, :t},
      plan_code: :string,
      subscription_at: {:string, "date-time"},
      subscriptions: {Lago.InvoicePreviewInputSubscriptions, :t}
    ]
  end
end
