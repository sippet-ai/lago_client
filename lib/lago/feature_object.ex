defmodule Lago.FeatureObject do
  @moduledoc """
  Provides struct and type for a FeatureObject
  """

  @type t :: %__MODULE__{
          code: String.t(),
          created_at: DateTime.t(),
          description: String.t() | nil,
          name: String.t() | nil,
          privileges: [Lago.FeaturePrivilegeObject.t()]
        }

  defstruct [:code, :created_at, :description, :name, :privileges]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: :string,
      created_at: {:string, "date-time"},
      description: {:union, [:string, :null]},
      name: {:union, [:string, :null]},
      privileges: [{Lago.FeaturePrivilegeObject, :t}]
    ]
  end
end
