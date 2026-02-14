defmodule Lago.SubscriptionEntitlement do
  @moduledoc """
  Provides struct and type for a SubscriptionEntitlement
  """

  @type t :: %__MODULE__{entitlement: Lago.SubscriptionEntitlementObject.t()}

  defstruct [:entitlement]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [entitlement: {Lago.SubscriptionEntitlementObject, :t}]
  end
end
