defmodule Lago.FeaturesPaginated do
  @moduledoc """
  Provides struct and type for a FeaturesPaginated
  """

  @type t :: %__MODULE__{features: [Lago.FeatureObject.t()], meta: Lago.PaginationMeta.t()}

  defstruct [:features, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [features: [{Lago.FeatureObject, :t}], meta: {Lago.PaginationMeta, :t}]
  end
end
