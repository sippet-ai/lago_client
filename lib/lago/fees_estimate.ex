defmodule Lago.FeesEstimate do
  @moduledoc """
  Provides struct and type for a FeesEstimate
  """

  @type t :: %__MODULE__{fees: [Lago.FeeEstimateObject.t()]}

  defstruct [:fees]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [fees: [{Lago.FeeEstimateObject, :t}]]
  end
end
