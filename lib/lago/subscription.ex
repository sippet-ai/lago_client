defmodule Lago.Subscription do
  @moduledoc """
  Provides struct and type for a Subscription
  """

  @type t :: %__MODULE__{subscription: Lago.SubscriptionObjectExtended.t()}

  defstruct [:subscription]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [subscription: {Lago.SubscriptionObjectExtended, :t}]
  end
end
