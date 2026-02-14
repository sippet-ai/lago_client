defmodule Lago.ApiLog do
  @moduledoc """
  Provides struct and type for a ApiLog
  """

  @type t :: %__MODULE__{api_log: Lago.ApiLogObject.t()}

  defstruct [:api_log]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [api_log: {Lago.ApiLogObject, :t}]
  end
end
