defmodule Lago.AddOn do
  @moduledoc """
  Provides struct and type for a AddOn
  """

  @type t :: %__MODULE__{add_on: Lago.AddOnObject.t()}

  defstruct [:add_on]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [add_on: {Lago.AddOnObject, :t}]
  end
end
