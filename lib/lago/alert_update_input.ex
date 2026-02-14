defmodule Lago.AlertUpdateInput do
  @moduledoc """
  Provides struct and type for a AlertUpdateInput
  """

  @type t :: %__MODULE__{alert: Lago.AlertBaseInput.t()}

  defstruct [:alert]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [alert: {Lago.AlertBaseInput, :t}]
  end
end
