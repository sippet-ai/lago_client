defmodule Lago.OverdueBalances do
  @moduledoc """
  Provides struct and type for a OverdueBalances
  """

  @type t :: %__MODULE__{overdue_balances: [Lago.OverdueBalanceObject.t()]}

  defstruct [:overdue_balances]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [overdue_balances: [{Lago.OverdueBalanceObject, :t}]]
  end
end
