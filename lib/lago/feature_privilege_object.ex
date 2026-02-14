defmodule Lago.FeaturePrivilegeObject do
  @moduledoc """
  Provides struct and type for a FeaturePrivilegeObject
  """

  @type t :: %__MODULE__{
          code: String.t(),
          config: map,
          name: String.t() | nil,
          value_type: String.t()
        }

  defstruct [:code, :config, :name, :value_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: :string,
      config: :map,
      name: {:union, [:string, :null]},
      value_type: {:enum, ["integer", "boolean", "string", "select"]}
    ]
  end
end
