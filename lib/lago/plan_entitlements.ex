defmodule Lago.PlanEntitlements do
  @moduledoc """
  Provides struct and type for a PlanEntitlements
  """

  @type t :: %__MODULE__{entitlements: [Lago.PlanEntitlementObject.t()]}

  defstruct [:entitlements]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [entitlements: [{Lago.PlanEntitlementObject, :t}]]
  end
end
