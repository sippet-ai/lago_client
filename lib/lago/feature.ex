defmodule Lago.Feature do
  @moduledoc """
  Provides struct and type for a Feature
  """

  @type t :: %__MODULE__{feature: Lago.FeatureObject.t()}

  defstruct [:feature]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [feature: {Lago.FeatureObject, :t}]
  end
end
