defmodule Lago.Event do
  @moduledoc """
  Provides struct and type for a Event
  """

  @type t :: %__MODULE__{event: Lago.EventObject.t()}

  defstruct [:event]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [event: {Lago.EventObject, :t}]
  end
end
