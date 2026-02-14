defmodule Lago.EventInput do
  @moduledoc """
  Provides struct and type for a EventInput
  """

  @type t :: %__MODULE__{event: Lago.EventInputObject.t()}

  defstruct [:event]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [event: {Lago.EventInputObject, :t}]
  end
end
