defmodule Lago.Alert do
  @moduledoc """
  Provides struct and type for a Alert
  """

  @type t :: %__MODULE__{alert: Lago.AlertObject.t()}

  defstruct [:alert]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [alert: {Lago.AlertObject, :t}]
  end
end
