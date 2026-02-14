defmodule Lago.CustomerProjectedUsage do
  @moduledoc """
  Provides struct and type for a CustomerProjectedUsage
  """

  @type t :: %__MODULE__{customer_projected_usage: Lago.CustomerProjectedUsageObject.t()}

  defstruct [:customer_projected_usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [customer_projected_usage: {Lago.CustomerProjectedUsageObject, :t}]
  end
end
