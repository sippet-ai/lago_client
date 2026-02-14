defmodule Lago.EventsCreated do
  @moduledoc """
  Provides struct and type for a EventsCreated
  """

  @type t :: %__MODULE__{events: [Lago.EventsCreatedEvents.t()]}

  defstruct [:events]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [events: [{Lago.EventsCreatedEvents, :t}]]
  end
end
