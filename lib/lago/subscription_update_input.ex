defmodule Lago.SubscriptionUpdateInput do
  @moduledoc """
  Provides struct and type for a SubscriptionUpdateInput
  """

  @type t :: %__MODULE__{
          status: String.t() | nil,
          subscription: Lago.SubscriptionUpdateInputSubscription.t()
        }

  defstruct [:status, :subscription]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      status: {:enum, ["active", "pending"]},
      subscription: {Lago.SubscriptionUpdateInputSubscription, :t}
    ]
  end
end
