defmodule Lago.GrossRevenues do
  @moduledoc """
  Provides struct and type for a GrossRevenues
  """

  @type t :: %__MODULE__{gross_revenues: [Lago.GrossRevenueObject.t()]}

  defstruct [:gross_revenues]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [gross_revenues: [{Lago.GrossRevenueObject, :t}]]
  end
end
