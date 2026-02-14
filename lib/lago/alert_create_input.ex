defmodule Lago.AlertCreateInput do
  @moduledoc """
  Provides struct and type for a AlertCreateInput
  """

  @type t :: %__MODULE__{alert: Lago.AlertCreateInputAlert.t()}

  defstruct [:alert]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [alert: {Lago.AlertCreateInputAlert, :t}]
  end
end
