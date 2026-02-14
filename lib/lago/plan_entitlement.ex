defmodule Lago.PlanEntitlement do
  @moduledoc """
  Provides struct and type for a PlanEntitlement
  """

  @type t :: %__MODULE__{entitlement: Lago.PlanEntitlementObject.t()}

  defstruct [:entitlement]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [entitlement: {Lago.PlanEntitlementObject, :t}]
  end
end
