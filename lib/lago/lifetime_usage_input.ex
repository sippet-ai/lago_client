defmodule Lago.LifetimeUsageInput do
  @moduledoc """
  Provides struct and type for a LifetimeUsageInput
  """

  @type t :: %__MODULE__{lifetime_usage: Lago.LifetimeUsageInputLifetimeUsage.t()}

  defstruct [:lifetime_usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [lifetime_usage: {Lago.LifetimeUsageInputLifetimeUsage, :t}]
  end
end
