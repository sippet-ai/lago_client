defmodule Lago.CustomerUsage do
  @moduledoc """
  Provides struct and type for a CustomerUsage
  """

  @type t :: %__MODULE__{customer_usage: Lago.CustomerUsageObject.t()}

  defstruct [:customer_usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [customer_usage: {Lago.CustomerUsageObject, :t}]
  end
end
