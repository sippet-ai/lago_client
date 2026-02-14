defmodule Lago.SubscriptionEntitlements do
  @moduledoc """
  Provides struct and type for a SubscriptionEntitlements
  """

  @type t :: %__MODULE__{entitlements: [Lago.SubscriptionEntitlementObject.t()]}

  defstruct [:entitlements]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [entitlements: [{Lago.SubscriptionEntitlementObject, :t}]]
  end
end
