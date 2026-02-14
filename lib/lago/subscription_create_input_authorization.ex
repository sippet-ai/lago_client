defmodule Lago.SubscriptionCreateInputAuthorization do
  @moduledoc """
  Provides struct and type for a SubscriptionCreateInputAuthorization
  """

  @type t :: %__MODULE__{amount_cents: integer, amount_currency: String.t()}

  defstruct [:amount_cents, :amount_currency]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [amount_cents: :integer, amount_currency: :string]
  end
end
