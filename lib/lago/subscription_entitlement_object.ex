defmodule Lago.SubscriptionEntitlementObject do
  @moduledoc """
  Provides struct and type for a SubscriptionEntitlementObject
  """

  @type t :: %__MODULE__{
          code: String.t(),
          description: String.t() | nil,
          name: String.t() | nil,
          overrides: map,
          privileges: [Lago.SubscriptionEntitlementPrivilegeObject.t()]
        }

  defstruct [:code, :description, :name, :overrides, :privileges]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: :string,
      description: {:union, [:string, :null]},
      name: {:union, [:string, :null]},
      overrides: :map,
      privileges: [{Lago.SubscriptionEntitlementPrivilegeObject, :t}]
    ]
  end
end
