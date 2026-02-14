defmodule Lago.FeatureUpdateInput do
  @moduledoc """
  Provides struct and type for a FeatureUpdateInput
  """

  @type t :: %__MODULE__{feature: Lago.FeatureBaseInput.t()}

  defstruct [:feature]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [feature: {Lago.FeatureBaseInput, :t}]
  end
end
