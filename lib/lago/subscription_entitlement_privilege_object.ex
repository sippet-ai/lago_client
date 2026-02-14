defmodule Lago.SubscriptionEntitlementPrivilegeObject do
  @moduledoc """
  Provides struct and type for a SubscriptionEntitlementPrivilegeObject
  """

  @type t :: %__MODULE__{
          code: String.t() | nil,
          config: map | nil,
          name: String.t() | nil,
          override_value: boolean | integer | String.t() | nil,
          plan_value: boolean | integer | String.t() | nil,
          value: boolean | integer | String.t() | nil,
          value_type: String.t() | nil
        }

  defstruct [:code, :config, :name, :override_value, :plan_value, :value, :value_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: :string,
      config: :map,
      name: {:union, [:string, :null]},
      override_value: {:union, [:boolean, :integer, :string, :null]},
      plan_value: {:union, [:boolean, :integer, :string]},
      value: {:union, [:boolean, :integer, :string]},
      value_type: {:enum, ["integer", "boolean", "string", "select"]}
    ]
  end
end
