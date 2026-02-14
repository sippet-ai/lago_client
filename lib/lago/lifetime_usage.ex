defmodule Lago.LifetimeUsage do
  @moduledoc """
  Provides struct and type for a LifetimeUsage
  """

  @type t :: %__MODULE__{lifetime_usage: Lago.LifetimeUsageObject.t()}

  defstruct [:lifetime_usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [lifetime_usage: {Lago.LifetimeUsageObject, :t}]
  end
end
