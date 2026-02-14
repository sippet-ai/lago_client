defmodule Lago.FeatureCreateInput do
  @moduledoc """
  Provides struct and type for a FeatureCreateInput
  """

  @type t :: %__MODULE__{feature: Lago.FeatureCreateInputFeature.t()}

  defstruct [:feature]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [feature: {Lago.FeatureCreateInputFeature, :t}]
  end
end
