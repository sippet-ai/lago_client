defmodule Lago.EventCreated do
  @moduledoc """
  Provides struct and type for a EventCreated
  """

  @type t :: %__MODULE__{event: Lago.EventCreatedEvent.t()}

  defstruct [:event]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [event: {Lago.EventCreatedEvent, :t}]
  end
end
