defmodule Lago.FeatureBaseInput do
  @moduledoc """
  Provides struct and type for a FeatureBaseInput
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          name: String.t() | nil,
          privileges: [map] | nil
        }

  defstruct [:description, :name, :privileges]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:union, [:string, :null]},
      name: {:union, [:string, :null]},
      privileges: [:map]
    ]
  end
end
