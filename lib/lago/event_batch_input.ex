defmodule Lago.EventBatchInput do
  @moduledoc """
  Provides struct and type for a EventBatchInput
  """

  @type t :: %__MODULE__{events: [Lago.EventInputObject.t()]}

  defstruct [:events]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [events: [{Lago.EventInputObject, :t}]]
  end
end
