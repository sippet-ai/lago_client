defmodule Lago.FeatureCreateInputFeature do
  @moduledoc """
  Provides struct and type for a FeatureCreateInputFeature
  """

  @type t :: %__MODULE__{
          code: String.t() | nil,
          description: String.t() | nil,
          name: String.t() | nil,
          privileges: [map] | nil
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
      privileges: [:map]
    ]
  end
end
