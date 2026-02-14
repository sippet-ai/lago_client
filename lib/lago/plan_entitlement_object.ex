defmodule Lago.PlanEntitlementObject do
  @moduledoc """
  Provides struct and type for a PlanEntitlementObject
  """

  @type t :: %__MODULE__{
          code: String.t(),
          description: String.t() | nil,
          name: String.t() | nil,
          privileges: [Lago.PlanEntitlementPrivilegeObject.t()]
        }

  defstruct [:code, :description, :name, :privileges]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: :string,
      description: {:union, [:string, :null]},
      name: {:union, [:string, :null]},
      privileges: [{Lago.PlanEntitlementPrivilegeObject, :t}]
    ]
  end
end
