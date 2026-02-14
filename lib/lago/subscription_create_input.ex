defmodule Lago.SubscriptionCreateInput do
  @moduledoc """
  Provides struct and type for a SubscriptionCreateInput
  """

  @type t :: %__MODULE__{
          authorization: Lago.SubscriptionCreateInputAuthorization.t() | nil,
          subscription: Lago.SubscriptionCreateInputSubscription.t()
        }

  defstruct [:authorization, :subscription]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      authorization: {Lago.SubscriptionCreateInputAuthorization, :t},
      subscription: {Lago.SubscriptionCreateInputSubscription, :t}
    ]
  end
end
