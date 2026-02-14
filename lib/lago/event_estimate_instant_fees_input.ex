defmodule Lago.EventEstimateInstantFeesInput do
  @moduledoc """
  Provides struct and type for a EventEstimateInstantFeesInput
  """

  @type t :: %__MODULE__{event: Lago.EventEstimateInstantFeesInputEvent.t()}

  defstruct [:event]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [event: {Lago.EventEstimateInstantFeesInputEvent, :t}]
  end
end
