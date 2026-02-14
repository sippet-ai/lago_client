defmodule Lago.EventBatchEstimateInstantFeesInput do
  @moduledoc """
  Provides struct and type for a EventBatchEstimateInstantFeesInput
  """

  @type t :: %__MODULE__{events: [Lago.EventEstimateInstantFeesInput.t()]}

  defstruct [:events]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [events: [{Lago.EventEstimateInstantFeesInput, :t}]]
  end
end
