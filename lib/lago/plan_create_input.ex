defmodule Lago.PlanCreateInput do
  @moduledoc """
  Provides struct and type for a PlanCreateInput
  """

  @type t :: %__MODULE__{plan: Lago.PlanCreateInputPlan.t()}

  defstruct [:plan]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [plan: {Lago.PlanCreateInputPlan, :t}]
  end
end
