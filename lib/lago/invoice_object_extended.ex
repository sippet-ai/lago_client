defmodule Lago.InvoiceObjectExtended do
  @moduledoc """
  Provides struct and type for a InvoiceObjectExtended
  """

  @type t :: %__MODULE__{
          credits: [Lago.CreditObject.t()] | nil,
          error_details: [Lago.ErrorDetailObject.t()] | nil,
          fees: [Lago.FeeObject.t()] | nil,
          subscriptions: [Lago.SubscriptionObject.t()] | nil
        }

  defstruct [:credits, :error_details, :fees, :subscriptions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      credits: [{Lago.CreditObject, :t}],
      error_details: [{Lago.ErrorDetailObject, :t}],
      fees: [{Lago.FeeObject, :t}],
      subscriptions: [{Lago.SubscriptionObject, :t}]
    ]
  end
end
