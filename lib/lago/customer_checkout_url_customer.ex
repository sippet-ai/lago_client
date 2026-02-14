defmodule Lago.CustomerCheckoutUrlCustomer do
  @moduledoc """
  Provides struct and type for a CustomerCheckoutUrlCustomer
  """

  @type t :: %__MODULE__{
          checkout_url: String.t() | nil,
          external_customer_id: String.t(),
          lago_customer_id: String.t(),
          payment_provider: String.t(),
          payment_provider_code: String.t() | nil
        }

  defstruct [
    :checkout_url,
    :external_customer_id,
    :lago_customer_id,
    :payment_provider,
    :payment_provider_code
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      checkout_url: :string,
      external_customer_id: :string,
      lago_customer_id: :string,
      payment_provider: :string,
      payment_provider_code: :string
    ]
  end
end
