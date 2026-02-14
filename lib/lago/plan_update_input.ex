defmodule Lago.PlanUpdateInput do
  @moduledoc """
  Provides struct and type for a PlanUpdateInput
  """

  @type t :: %__MODULE__{plan: Lago.PlanUpdateInputPlan.t()}

  defstruct [:plan]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [plan: {Lago.PlanUpdateInputPlan, :t}]
  end
end
