defmodule Lago.Plan do
  @moduledoc """
  Provides struct and type for a Plan
  """

  @type t :: %__MODULE__{plan: Lago.PlanObject.t()}

  defstruct [:plan]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [plan: {Lago.PlanObject, :t}]
  end
end
